import "bootstrap";
import $ from 'jquery';
import {fullCalendar} from  'fullcalendar';
import { initUpdateNavbarOnScroll } from '../components/navbar';
initUpdateNavbarOnScroll();

$(function() {
  $('#calendar').fullCalendar({
    events: "/events",
    defaultView: 'month',
    height: 'auto'
  });

})



