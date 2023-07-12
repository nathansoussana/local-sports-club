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

    //const sportsCheckboxes = document.querySelectorAll('[name="user[sport_ids][]"]');
    //console.log(sportsCheckboxes)
    //sportsCheckboxes.forEach(checkbox => {
    //console.log(checkbox)
    //checkbox.addEventListener('change', handleSportsSelection);
    //});

    multiStepForm.addEventListener("click", (e) => {
      if (e.target.matches("[data-next]")) {
        currentStep += 1
      } else if (e.target.matches("[data-previous]")) {
        currentStep -= 1
      }
      this.showCurrentStep()
    })


  }
  handleSportsSelection() {
    const levelCards = [...document.querySelectorAll('.level-card')]
    //levelCards.forEach(card => card.style.display = 'none') // Initially hide all level cards
    console.log(levelCards)
    const selectedSports = [...document.querySelectorAll('[name="user[sport_ids][]"]:checked')]
    selectedSports.forEach(sport => {
      const correspondingLevelCard = document.querySelector(`.level-card[data-sport="${sport.value}"]`)
      console.log(correspondingLevelCard)
      if(correspondingLevelCard) {
        correspondingLevelCard.style.display = 'block'; // Show the level card for selected sports
      }
    })
  }
  test() {
    console.log("Why can't you find it?")
  }
  showCurrentStep() {
    const multiStepForm = document.querySelector("[data-multi-step]")
    const formSteps = [...multiStepForm.querySelectorAll("[data-step]")]
    formSteps.forEach((step, index) => {
      step.classList.toggle("active", index === currentStep)
    })
  }

}
