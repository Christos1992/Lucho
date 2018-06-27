import "bootstrap";
import $ from 'jquery';
import 'fullcalendar';


$(function() {

  // page is now ready, initialize the calendar...

  $('#calendar').fullCalendar({
    eventSources: [

    // your event source
    {
      url: '/myfeed.php', // use the `url` property
      color: 'yellow',    // an option!
      textColor: 'black'  // an option!
    }

    // any other sources...

  ]
    // put your options and callbacks here
  })

});
