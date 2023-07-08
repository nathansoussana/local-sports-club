import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  connect() {
    this.initMultiStepForm();
    this.initSportSelection();
  }

  initMultiStepForm() {
    const multiStepForm = document.querySelector("[data-multi-step]")
    const formSteps = [...multiStepForm.querySelectorAll("[data-step]")]
    let currentStep = formSteps.findIndex((step) => {
      return step.classList.contains("active");
    })

    if (currentStep < 0) {
      currentStep = 0
      this.showCurrentStep(formSteps, currentStep);
    }
    multiStepForm.addEventListener("click", (e) => {
      if (e.target.matches("[data-next]")) {
        currentStep += 1
      } else if (e.target.matches("[data-previous]")) {
        currentStep -= 1
      }
      this.showCurrentStep(formSteps, currentStep);
    })
  }

  showCurrentStep(formSteps, currentStep) {
    formSteps.forEach((step, index) => {
      step.classList.toggle("active", index === currentStep)
    })
  }

  initSportSelection() {
    const sportCheckboxes = document.querySelectorAll('.sport-checkbox');
    sportCheckboxes.forEach((checkbox) => {
      checkbox.addEventListener('change', function() {
        const selectField = this.closest('.sport-selection').querySelector('.sport-level');
        if (this.checked) {
          selectField.disabled = false;
        } else {
          selectField.disabled = true;
        }
      });
    });
  }
}
