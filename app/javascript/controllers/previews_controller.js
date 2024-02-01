import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="previews"
export default class extends Controller {
  static targets = ["input", "preview"]

  preview(){
    let input = this.inputTarget;
    let preview = this.previewTarget;
    let file = input.files[0]
    let reader = new FileReader();

    reader.onloadend = function(){
      preview.src = reader.result;
    };

    if (file) {
        reader.readAsDataURL(file);
    } else {
      preview.src = "";
    }

    const removeButton = document.getElementById("remove_image_button");
    removeButton.style.display = "inline";

  }

  remove(){
    const fileField = document.getElementById("image_upload")
    fileField.value = null;

    let preview = this.previewTarget;
    preview.src = "";

    const removeButton = document.getElementById("remove_image_button");
    removeButton.style.display = "none";
  }
}
