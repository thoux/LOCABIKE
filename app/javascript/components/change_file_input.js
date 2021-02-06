const changeFileInput = () => {
  const fileInputs = document.querySelectorAll('.form-control-file');
  fileInputs.forEach(fileInput => {
    fileInput.addEventListener('change', (e) => {
      console.log(fileInput);
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
    });
  });
}

export { changeFileInput };
