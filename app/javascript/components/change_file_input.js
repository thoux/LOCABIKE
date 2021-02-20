const changeFileInput = () => {
  const fileInputs = document.querySelectorAll('.form-control-file');
    if (fileInputs) {
    fileInputs.forEach(fileInput => {
      fileInput.addEventListener('change', (e) => {
        // Get the selected file
        const [file] = e.target.files;
        // Get the file name and size
        const { name: fileName, size } = file;
        // Convert size in bytes to kilo bytes
        const fileSize = (size / 1000).toFixed(2);
        // Set the text content
        const fileNameAndSize = `${fileName} - ${fileSize}KB`;
        const fileNameDiv = fileInput.parentNode.nextElementSibling;
        fileNameDiv.innerText = fileNameAndSize;
        // Change label
        fileInput.previousSibling.innerText = 'Modifier la photo';
        // Remove image previous image preview
        const imagePreview = document.querySelector('.bike-ad-photo');
        // const targetPreview = document.querySelector('.target-preview');
        const targetPreview = fileInput.parentNode.nextElementSibling.nextElementSibling;
        if (imagePreview) {
          // console.log(imagePreview)
          imagePreview.style.display = "none";
        }
        if ( /\.(jpe?g|png|gif)$/i.test(file.name) ) {
          const reader = new FileReader();
    
          reader.addEventListener("load", (e) => {
            targetPreview.innerHTML = '';
            const image = new Image();
            image.style = "width: 100%;";
            image.classList = "my-2";
            image.title = file.name;
            image.src = e.srcElement.result;
            targetPreview.appendChild( image );
          }, false);
    
          reader.readAsDataURL(file);
        }
      });
    });
  }
}

export { changeFileInput };
