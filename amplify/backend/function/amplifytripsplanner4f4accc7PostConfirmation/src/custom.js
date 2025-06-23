const { Sha256 } = require("@aws-crypto/sha256-js");
const { defaultProvider } = require("@aws-sdk/credential-provider-node");
const { SignatureV4 } = require("@aws-sdk/signature-v4");
const { HttpRequest } = require("@aws-sdk/protocol-http");
const { default: fetch, Request } = require("node-fetch");

const GRAPHQL_ENDPOINT = process.env.API_AMPLIFYTRIPSPLANNER_GRAPHQLAPIENDPOINTOUTPUT;
const AWS_REGION = process.env.AWS_REGION || 'us-east-1';

const query = /* GraphQL */ `
  mutation createProfile($email: String!,$owner: String!) {
    createProfile(input: {
      email: $email,
      owner: $owner,
    }) {
      email
    }
  }
`;

/**
 * @type {import('@types/aws-lambda').PostConfirmationTriggerHandler}
 */
exports.handler = async (event) => {
  console.log(`Received event: ${JSON.stringify(event)}`);

  // Extract user attributes and log
  const email = event.request.userAttributes.email;
  const userSub = event.request.userAttributes.sub;
  const userName = event.userName;

  console.log(`Extracted email: ${email}`);
  console.log(`Extracted sub: ${userSub}`);
  console.log(`UserName: ${userName}`);

  const variables = {
    email: email,
    owner: `${userSub}::${userName}`,
  };

  console.log(`GraphQL variables: ${JSON.stringify(variables)}`);

  const endpoint = new URL(GRAPHQL_ENDPOINT);
  console.log(`GraphQL endpoint URL: ${endpoint.href}`);

  const signer = new SignatureV4({
    credentials: defaultProvider(),
    region: AWS_REGION,
    service: 'appsync',
    sha256: Sha256,
  });

  const requestToBeSigned = new HttpRequest({
    method: 'POST',
    headers: {
      'Content-Type': 'application/json',
      host: endpoint.host,
    },
    hostname: endpoint.host,
    body: JSON.stringify({ query, variables }),
    path: endpoint.pathname,
  });

  console.log(`Request to be signed: ${JSON.stringify({
    method: requestToBeSigned.method,
    headers: requestToBeSigned.headers,
    body: requestToBeSigned.body,
    path: requestToBeSigned.path,
  })}`);

  let signed;
  try {
    signed = await signer.sign(requestToBeSigned);
    console.log(`Signed request: ${JSON.stringify(signed)}`);
  } catch (signError) {
    console.error(`Error signing request: ${signError}`);
    throw signError; // rethrow to see in logs
  }

  const request = new Request(endpoint, signed);
  console.log(`Final Request object created.`);

  let statusCode = 200;
  let body;
  let response;

  try {
    response = await fetch(request);
    console.log(`Fetch response status: ${response.status}`);
    body = await response.json();
    console.log(`Response body: ${JSON.stringify(body)}`);
    if (body.errors) {
      console.error(`GraphQL errors: ${JSON.stringify(body.errors)}`);
      statusCode = 400;
    }
  } catch (error) {
    console.error(`Fetch error: ${error}`);
    statusCode = 500;
    body = {
      errors: [
        {
          message: error.message,
        },
      ],
    };
  }

  console.log(`Returning response with statusCode: ${statusCode} and body: ${JSON.stringify(body)}`);
  return {
    statusCode,
    body: JSON.stringify(body),
  };
};