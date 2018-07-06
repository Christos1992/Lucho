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
    title: 'Take 3ml of Bactrim',
    start: '2018-07-016',
    url: 'http://localhost:3000/parents/1/incidents/2',
     description: "BACTRIM"

  },
  {
     title: 'Lucho Parent Gathering Event',
    start: '2018-07-26',
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
