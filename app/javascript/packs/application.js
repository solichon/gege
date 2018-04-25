import 'bootstrap-select';
import 'bootstrap-select/dist/css/bootstrap-select.css';

import "bootstrap";
import $ from 'jquery';

import 'fullcalendar';
import 'fullcalendar/dist/fullcalendar.css';
import 'fullcalendar/dist/locale/fr.js'
// import 'fullcalendar/lang/fr.js';



$(document).ready(function() {
  $('.selectpicker').selectpicker();

  // page is now ready, initialize the calendar...

  $('#calendar').fullCalendar({
    locale:"fr-fr",
    defaultView: window.innerWidth > 700 ? 'agendaWeek' : 'agendaDay',
    themeSystem: 'bootstrap3',
    header: {
      left: window.innerWidth > 700 ? 'prev,next,addPrint' : 'prev,next',
      right: 'month,agendaWeek,agendaDay,'
    },
    footer: {
      left: 'custom1,custom2',
      weekNumbers: true,
      eventLimit: true, // allow "more" link when too many events
    },
    height: 100,
    contentHeight: 520,  //size height
    aspectRatio: 1, //ration height vs. width (don't work)
    minTime: '09:00:00',
    maxTime: '18:00:00',
    selectable: true,
    allDaySlot: false,
    nowIndicator: true,
    displayEventTime: false,
    // put your options and callbacks here
    titleFormat: '[Gégé, quel est mon planning?]',
    customButtons: {
      addPrint: {
        text: 'Imprimer',
        bootstrapGlyphicon:'glyphicon glyphicon-print',
        click: function() {
          window.print();
        }
      }
    },
    select: function(startDate, endDate) {
      window.location.href = "/timeslots/new.html"
    },
    // eventClick: function(calEvent, jsEvent, view) {
    //   debugger;
    //   alert('clickend');
    eventRender: function(eventObj, $el) {
      // console.log('eventObj:', eventObj);
      $el.popover({
        html: true,
        title: eventObj.capacity,
        content: `<a href="/timeslots/${eventObj.id}/bookings/new">Ajouter Réservation</a><a href="/timeslots/${eventObj.id}">Détails </a>`,
        trigger: 'click',
        placement: 'top',
        container: 'body'
      })
    },
    events: window.innerWidth > 700 ? '/timeslots' : '/timeslots?xs=true',
    eventBackgroundColor: '#FFFFFF',
  })
});


$(document).on('click', function(e) {
  $('[data-toggle="popover"],[data-original-title]').each(function() {
    //the 'is' for buttons that trigger popups
    //the 'has' for icons within a button that triggers a popup
    if (!$(this).is(e.target) && $(this).has(e.target).length === 0 && $('.popover').has(e.target).length === 0) {
      $(this).popover('hide').data('bs.popover').inState.click = false // fix for BS 3.3.6
    }

  });
});

