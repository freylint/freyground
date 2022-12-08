import { defineFeature, loadFeature } from 'jest-cucumber';

const feature = loadFeature('features/smi.feature');

defineFeature(feature, test => {
    test('The runtime needs to know if a service is running', ({ then, and }) => {
        then('SMI provides keepalive_ping', () => {
            notYetImplemented()
        });

        and('SMI provides keepalive_pong', () => {
            notYetImplemented()
        });
    });

    test('A service needs ability to query Blackboard', ({ then }) => {
        then('SMI provides blackboard_address_request', () => {
            notYetImplemented()
        });
    });

    test('service and blackboard need to communicate', ({ then }) => {
        then('SMI provides blackboard_requests enum', () => {
            notYetImplemented()
        });
    });

    test('service needs to respond to request from blackboard', ({ then }) => {
        then('SMI provides blackboard_responses variant', () => {
            notYetImplemented()
        });
    });
});