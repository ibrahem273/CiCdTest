import 'package:flutter/material.dart';


// A route that blocks interaction with previous routes.

// [ModalRoute]s cover the entire [Navigator].
// They are not necessarily [opaque],
// however; for example, a pop-up menu uses a [ModalRoute] 
//but only shows the menu in a small box overlapping the previous route.

// The T type argument is the return value of the route. If there is no return value, consi
RouteObserver appRouteObserver = RouteObserver<ModalRoute>();
//didpopNext() in this method on the off chance that you have extended
//homepage with RouteAware and in case second page is poped so homepage
//is noticable now

//didPushNext is called in other words this method  callde when new screen
//is pushed from current screen and the current screen in no longer visible 
