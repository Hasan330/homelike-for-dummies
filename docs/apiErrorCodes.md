## Different codes, same messge:

​```
E0000 && E0001 --> Invalid Key
E0002 && E0004 --> No user found, please make sure you are authenticated
E0037 && E0084 && E0085 --> Invalid notification, not all variables needed are present
E0038 && E0068 --> Email not found
E0039 && E0041 && E0066 && E0067 --> Invalid token
E0090 && E0091 (plus duplicate messages)
E0092 && E0093 --> Token is not provided!
E0094 && E0095 --> Duplicate IBAN!
​```

## Same Codes, different message:

​```
E0011:
Requested resource not available
You must be a landlord to create an apartment
You are not allowed to access this route
​
E0090:
Invalid bank account or legal entity
Restrict Vacancy
IBAN is not provided!
​
E0091:
Legal entity is marked for deletion
IBAN is not provided!
​```

## Different Codes, no message:

​```
E0008
E0009
E0010
E0012
E0022
E0029
E0030
E0059
E0060
​```

## Codes not found in the project:

​```
E0026
E0032
E0042
E0043
E0050
E0079
E0080
​```

## Errors with no codes:
```
BadRequest(`No request found with booking code ${obj.code}`); --> NO\*REQUEST_FOUND
BadRequest('Customers already created, trying to create multiple customer'); --> CUSTOMER_ALREADY_EXISTS
BadRequest('Unable to create customer'); --> CUSTOMER_CREATION_ERROR
BadRequest(`No payment found with _id ${paymentId}`); --> NO_PAYMENT_FOUND
BadRequest('Only one general credit card can be created'); --> DUPLICATE_CC_CREATION
BadRequest('Invalid billing address'); --> INVALID_BILLING_ADDRESS
BadRequest(`Unable to create general credit card, ${error.message}`); --> GENERAL_CC_CREATION_ERROR
BadRequest('Unable to update source details with the billing address information'); --> UNACCEPTABLE_BILLING_ADDRESS
BadRequest('Unable to attach source with customer'); --> CANT_ATTACH_SOURCE
BadRequest('invalid weekly payout transition'); --> INVALID_PAYOUT_TRANSITION
BadRequest('Can not invite user'); --> CANT_INVITE_USER
BadRequest('Can not invite user', error.message); --> CANT_INVITE_USER
BadRequest('Cant modify pricing related fields when request is outside draft status'); --> REQUEST_NOT_DRAFT
BadRequest('Number of guests exceeds apartments maximum'); --> MAX_OCCUPANCY_EXCEEDED
FeathersError('Error while generating terms and conditions', error.message); --> CANT_GENERATE_TERMS
BadRequest(`Reward type : ${data.type} can not be created twice`); --> DUPLICATE_REWARD_TYPE
BadRequest(`Unknown type : ${data.type}`); --> UNKNOWN_REWARD_TYPE
BadRequest(`Invalid Card number ${walletAddress}`); --> INVALID_CARD_NUMBER
BadRequest('Coordinates not found');
BadRequest(`Please provide a valid email address ending at ${emailDomain}`); --> INVALID_EMAIL_ADDRESS
NotAcceptable('E-mail already exists');
Forbidden('Role error, can not be restricted.'); --> INSUFICIENT_USER_RIGHTS
FeathersError(`Error happened while updating Toc, ${error.message}`); --> ERROR_UPDATING_TOC
Forbidden('Role error, can not be deleted.'); --> UNAUTHORISED_TO_DELETE
FeathersError(`Error happened while attempting to delete user, ${error.message}`);
BadRequest('E0000: Invalid Key'); --> INVALID_IMPERSONATE_KEY
BadRequest('E0001: Invalid Key'); --> INVALID_REFRESH_KEY
NotAuthenticated('E0002: No user found, please authenticate again'); --> NO_USER_FOUND
BadRequest('E0003: No type is specified'); --> TYPE_UNSPECIFIED
NotAuthenticated('E0004: No user found, please make sure you are authenticated');
Forbidden('E0005: You are not allowed to perform this action');
NotFound('E0006: Page not found');
NotAuthenticated('E0007: Please verify your email address before continuing');
BadRequest(`E0008: ${result.body}`); --> SLACK_ERROR
BadRequest(`E0009: ${result.messages[0]['error-text']}`); --> SMS_ERROR
BadRequest(`E0010: ${err}`); --> POPULATE_ACCOUNT
Forbidden('E0011: Requested resource not available');
Forbidden('E0011: You must be a landlord to create an apartment'); --> AUTH
Forbidden('E0011: You are not allowed to access this route'); --> AUTH
BadRequest(`E0012: ${err}`); --> ERROR_PATCHING_APARTMENT
BadRequest('E0013: Stripe Token required!'); --> STRIPE_TOKEN_REQUIRED
BadRequest('E0014: Legal Eentity required!');
BadRequest('E0015: Please search for company using customUrl');
NotFound('E0016: No matching record found');
BadRequest('E0017: Owner required!');
BadRequest('E0018: Stripe Id not provided!');
BadRequest('E0019: Please download using type param');
BadRequest('E0020: Access denied'); --> ACCESS_DENIED / HELLOSIGN_ACCESS_DENIED
BadRequest('E0021: Apartment without representative. Set representative first!');
BadRequest(`E0022: ${error}`); --> HELLOSIGN_SIGNATURE_ERROR
BadRequest('E0023: No request is specified');
BadRequest('E0024: Apartment for request not found');
BadRequest('E0025: RA for request not found');
BadRequest('E0027: User representative for request not found');
BadRequest('E0028: Account for landlord for request not found');
BadRequest(`E0029: ${error}`); --> SCRIVENER_ERR
BadRequest(`E0030: ${error}`); --> HELLOSIGN_ERR
BadRequest(`E0031: Invalid File type ${info.MIME}`);
BadRequest('E0033: Invalid Business type');
BadRequest('E0034: Account email does not match invitation email');
BadRequest('E0035: Invite is not valid');
BadRequest('E0036: Invitation has expired');
BadRequest('E0037: Invalid notification, not all variables needed are present');
BadRequest('E0038: Email not found');
BadRequest('E0039: Invalid token');
BadRequest('E0040: Invalid password');
BadRequest('E0041: Invalid token');
BadRequest(`E0044: Invalid transition for:: ${message.type} && ${message.status}`); **\*\*\*\***IMP
BadRequest('E0045: Create and assign new Rental Agreement to your apartment');
BadRequest('E0046: Invalid Limitation');
BadRequest('E0047: Invalid Cancel Conditions');
BadRequest('E0048: Invalid Cancel Flexibility');
FeathersError('E0049: Not a valid email type');
BadRequest('E0051: Not a valid apartment');
Forbidden('E0052: Apartment unavailable');
BadRequest('E0053: Bad Request Start Dates');
BadRequest('E0054: Bad Request End Dates');
BadRequest('E0055: Apartment required!');
BadRequest('E0056: Invalid status change');
BadRequest('E0057: Not a valid internal status change');
next(new errors.BadRequest('E0058: Previous password not correct'));
BadRequest(`E0059: ${err}`);
BadRequest(`E0060: ${err}`);
BadRequest('E0061: Please provide a valid domain');
BadRequest('E0062: Email does not match invitation');
BadRequest('E0063: Invite is not valid');
BadRequest('E0064: Invitation has expired'); //repeated
BadRequest('E0065: Please use the merge-account endpoint for merging existing accounts');
BadRequest('E0066: Invalid token');
BadRequest('E0067: Invalid token');
BadRequest('E0068: Email not found');
BadRequest('E0069: Apartment without representative. Set representative first!');
BadRequest('E0070: Invalid webhook source');
BadRequest('E0071: Invalid webhook');
BadRequest('E0072: Invalid salesforce webhook secret');
BadRequest('E0073: Invalid secretadmin webhook secret');
BadRequest(`E0074: Invalid ${service} ${charge.id}`);
BadRequest('E0075: No statement_descriptor on source object');
BadRequest('E0076: No payment found');
BadRequest('E0077: Couldnt find active charge for payment');
BadRequest('E0078: Invalid webhook');
NotFound(`E0081: Item ${id} not found.`);
BadRequest('E0082: Invalid status');
eject(new errors.BadRequest('E0083: No type specified')); --> TYPE_UNSPECIFIED
BadRequest('E0084: Invalid notification, not all variables needed are present'); --> MISSING_NOTIFICATION_VARIABLES
BadRequest('E0085: Invalid notification, not all variables needed are present'); --> MISSING_NOTIFICATION_VARIABLES
BadRequest('E0086: Stripe Upload Failed');
BadRequest('E0087: Invalid marketing webhook secret');
BadRequest('E0088: Invalid running mode'); --------> CANT FIND IT !!!!!!!!
BadRequest(`E0089: Updating account failed. ${object.id}`); --> UPDATING_ACCOUNT_FAILED
BadRequest('E0090: Invalid bank account or legal entity');
BadRequest('E0090: Restrict Vacancy'); (changed) --> VACANCY_RESTRICTED
BadRequest('E0090: IBAN is not provided!');
BadRequest('E0091: Legal entity is marked for deletion');
BadRequest('E0091: IBAN is not provided!'); --> IBAN_NOT_PROVIDED
BadRequest('E0092: Token is not provided!');
BadRequest('E0093: Token is not provided!');
BadRequest('E0094: Duplicate IBAN!');
BadRequest('E0095: Duplicate IBAN!');
BadRequest('E0096: Error in resending verfication email');
BadRequest('E0097: PDF could not be generated');
```

```
BadRequest(`E0098: iCal service error: ${error.message}`);
BadRequest(`E0098: iCal service error: action ${action} is not allowed`);
BadRequest('E0098: iCal service error: action is required');
BadRequest(`E0098: iCal service error: ${error.message}`);
```

```
BadRequest('E0099: Request not found');
BadRequest('E0100: Apartment not found');
BadRequest('E0101: iCal service error: type is required');
BadRequest('EV001: Secret is not valid');
BadRequest('EV002: No schema found');
BadRequest('EV003: object feald is required');
​```

```
BadRequest('M0003: monitoringHelper is missed in options');
BadRequest('Draft request already exists');
```
