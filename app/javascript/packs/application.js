import "bootstrap";
import $ from 'jquery';
import {fullCalendar} from  'fullcalendar';
import { initUpdateNavbarOnScroll } from '../components/navbar';
initUpdateNavbarOnScroll();

$(function() {
  $('#calendar').fullCalendar({
    // events: "/events",
    eventSources:[
    {
      url: "/events"
    }],
     eventLimit: true,
  views: {
    agenda: {
      eventLimit: 3
    }
  },
   timeFormat: ' ',

    eventClick:  function(event, jsEvent, view) {
        console.log(event.id);

           document.querySelector(".modal-footer a").setAttribute( 'href', event.id)
            $('#modalTitle').html(event.title);
            $('#modalBody').html(event.description);
            $('#eventUrl').attr('href',event.url);
            $('#fullCalModal').modal();
        },
   events: [
  {
    title: 'Fake link for a Medication took',
    start: '2018-06-06',
    url: 'http://localhost:3000/parents/1/incidents/2',
     description: "Fatigue"

  },
  {
     title: 'Fake link for a Facebook event',
    start: '2018-06-11',
    url: 'https://www.facebook.com/LuchoWithYou/',
     description: "Meeting with Lucho community"

  }],

    eventRender: function(event, element) {
            element.find('.fc-title').append("<br/>" + event.description);


        }
    // eventRender: function(event, element) {
    //         element.find('.fc-title').append("<br/>" + event.description);
    //     }
  });

})
