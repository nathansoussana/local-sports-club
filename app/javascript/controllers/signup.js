import { Controller } from "@hotwired/stimulus";
export default class extends Controller {
 connect() {
  const multiStepForm = document.querySelector("[data-multi-step]")
  const formSteps = [...multiStepForm.querySelectorAll("[data-step]")]
  let currentStep = formSteps.findIndex((step) => {
   return step.classList.contains("active");
  })
  if (currentStep < 0) {
   currentStep = 0
   showCurrentStep()
  }
  multiStepForm.addEventListener("click", (e) => {
   if (e.target.matches("[data-next]")) {
    currentStep += 1
   } else if (e.target.matches("[data-previous]")) {
    currentStep -= 1
   }
   showCurrentStep()
  })
  function showCurrentStep() {
   formSteps.forEach((step, index) => {
    step.classList.toggle("active", index === currentStep)
   })
  }
 }
}