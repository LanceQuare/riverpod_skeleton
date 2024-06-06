# Riverpod skeleton

Project skeleton for Flutter with Riverpod.

## Getting Started

You can simply run `flutter pub get` to start.
And after that, run the code-generator with `flutter pub run build_runner watch`.

## Roadmaps
- [x] Add Riverpod: for state management
- [x] Add Go Route: for routing
- [x] Add Freezed: for immutable classes
- [x] Add Isar: for local db
- [x] Add Dio: for network requests
- [ ] Add Catcher: for error handling
- [ ] Add envied: for environment variables
- [x] To consider nested UI and routing for deep linking
- [ ] To consider responsive design
- [ ] To consider localization
- [ ] Research for testing
- [ ] Update README.md for plan migrate from GetX to Riverpod

## Migration from GetX to Riverpod
- Rewrite the controllers to providers.
- Rewrite the bindings to use providers.
- Update the UI to use consumer instead of GetBuilder(or Obx()).
- Rewrite the routes to use Go Route.
- Rewrite the services by Flutter singleton pattern, add observer to application level and add callbacks if necessary.
- Update Application and main.dart by using go_route and riverpod.

### Rewrite the Controllers to Providers
With Riverpod code generation, it could be easy cause they are controllers in my MVC pattern.
Just one thing more you need to consider is if you want to use class based provider, that could force you to redesign the VO object for UI layer to make it work perfectly.

### Rewrite the bindings to use Providers
As above, by using hooks, we can still keep most of logics out of view layer like getx does. So should be easy to rewrite.

### Rewrite the Services
What my expectation for service is a singleton object that could be initialized and terminated alone with the application lifecycle.
So I will add a observer to the application level to manage the lifecycle of the services, by using singleton pattern.

## References
- [Riverpod with Go Route for auth design](https://github.com/lucavenir/go_router_riverpod/blob/master/example/lib/main.dart)

