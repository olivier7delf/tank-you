// es modules are recommended, if available, especially for typescript
import flatpickr from "flatpickr";


// alert("CCCO")



const date_pickr = () => {
  // const truc = document.querySelector(".datepickr.datepickr-corr")
  // console.log(truc.dataset.params);
  flatpickr(
    ".datepickr", {
    mode: "range",
    dateFormat: "Y-m-d",
    // defaultDate: [Date.now(), Date.now()+3]
  });
}

export { date_pickr }
