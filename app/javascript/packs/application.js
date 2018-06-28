import "bootstrap";
import $ from 'jquery';
import {fullCalendar} from  'fullcalendar';
import { initUpdateNavbarOnScroll } from '../components/navbar';
initUpdateNavbarOnScroll();

$(function() {
  $('#calendar').fullCalendar({
    events: "/events",
     eventLimit: true, // for all non-agenda views
  views: {
    agenda: {
      eventLimit: 6 // adjust to 6 only for agendaWeek/agendaDay
    }
  }

  });

})
