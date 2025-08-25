import { Calendar } from '@fullcalendar/core';
import dayGridPlugin from '@fullcalendar/daygrid';

document.addEventListener('DOMContentLoaded', function() {
  var calendarEl = document.getElementById('calendar')

  var calendar = new Calendar(calendarEl, {
    plugins: [dayGridPlugin],
    initialView: 'dayGridMonth',
    events: '/workouts/calendar_events',  // ★ ここでAPIからイベント取得
    eventContent: function(arg) {
      return {
        html: '<span style="font-size: 24px; color: green;">✔</span>'
      }
    }
  })

  calendar.render()
})