// es modules are recommended, if available, especially for typescript
import flatpickr from "flatpickr";


// alert("CCCO")



const date_pickr = () => {
  flatpickr(
    ".datepickr", {
    mode: "range",
    dateFormat: "Y-m-d",
    // defaultDate: [Date.now(), Date.now()+3]
  });
}

export { date_pickr }
