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
      url: "/events",
      data: {
        custom_param1: 'metric'
      },
       description: "heloooo"
    }],
     eventLimit: true, // for all non-agenda views
  views: {
    agenda: {
      eventLimit: 3 // adjust to 6 only for agendaWeek/agendaDay
    }
  },
   timeFormat: ' ',
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
  });

})
