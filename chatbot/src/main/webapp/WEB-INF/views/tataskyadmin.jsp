
 <script type="text/javascript">
$(function(){

    $(".uploader-btn").click(function(){
      $("#fileupload").click();
    });
 
   $("#fileupload").change(function(){
    var form = document.getElementById('form-upload');
    var fileInput = document.getElementById('fileupload');
    var file = fileInput.files[0];
    console.log(file);
    var formData = new FormData(form);

    formData.append('file', file);

    var xhr = new XMLHttpRequest();
    xhr.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
            alert("File Uploaded successfully!!!");
        }else if(this.status==400 || this.status==404 || this.status==500){
            alert("Error Occured!! status: "+this.status+", "+ this.responseText);
        }
    };
    xhr.open('POST', form.getAttribute('action'), true);
    xhr.send(formData);

   });

});
</script>
 
 <div id="s360-adminpage">
    	<a href="https://devdata.simplify360.com:9443/bmuwapi/configure/download" class="a-href"><i class="fa fa-download"></i> Download Chat</a> &nbsp;&nbsp;&nbsp;
        <a href="javascript:void(0);" class="a-href uploader-btn" ><i class="fa fa-upload"></i> Upload Excel</a>
        <div style="display: none;">
           <form id="form-upload" action="/chatbot/tatasky/uploadFile" enctype="multipart/form-data">
            <input name="file" id="fileupload"  type="file">
          </form>
        </div>
</div>
