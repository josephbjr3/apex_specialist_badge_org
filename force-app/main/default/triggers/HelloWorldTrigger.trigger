/**
 * * This trigger prints 'Hello World' to the debug console when an account record is inserted.
 */
trigger HelloWorldTrigger on Account(before insert) {
  System.debug('Hello World!');
}