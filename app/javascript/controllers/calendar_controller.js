import { Controller } from "stimulus";
import FullCalendar from '@fullcalendar/core';
import dayGridPlugin from '@fullcalendar/daygrid';
import '@fullcalendar/core/main.css';

export default class extends Controller {
  connect() {
    console.log("Calendar controller connected");
    const calendarEl = this.element;
    const calendar = new FullCalendar(calendarEl, {
      plugins: [dayGridPlugin],
      initialView: "dayGridMonth",
      dateClick: this.handleDateClick.bind(this), // Add the event listener for date clicks
    });

    calendar.render();
  }

  handleDateClick(info) {
    const dateClicked = info.dateStr; // Get the clicked date as a string

    // Prompt the user for event details
    const eventTitle = prompt("Enter event title:");

    if (eventTitle) {
      // Add the event to the calendar
      info.view.calendar.addEvent({
        title: eventTitle,
        start: dateClicked,
        allDay: true, // Make the event an all-day event
      });
    }
  }
}
