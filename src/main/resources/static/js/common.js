function a_submit(formId){
    $(document).ready(function(){
        document.getElementById(formId).submit();
    });
}
// ============================================================================================================
// Images processing in admin panel.
let imagesCounter = 0;
let imagesBlock = document.querySelector(".imagesBlock");

function addImage(){
    if (imagesCounter == 0){
        document.querySelector(".submitImages").style.display = "block"
    }
    let newImageBlock = '<div class = "addimage"><form method="dialog" name = "form' + imagesCounter+'" ' +
        'enctype="multipart/form-data" class = "imageform' + imagesCounter+ '"><input type = "file" ' +
        'name = "file" class = "image' + imagesCounter +'"/> <input type="hidden" name = "_csrf" ' +
        'value = "${_csrf.token}"> </form></div>'
    imagesBlock.innerHTML +=  newImageBlock;
    imagesCounter++;
}

function submitImages(){
    for (let i = 0; i<imagesCounter; i++){
        let formdata = new FormData(document.querySelector(".imageform" + i));
        fetch('/product/${product.id}/addImageToExist', {
            method: 'POST',
            body: formdata
        })
    }
    console.log("success added images");
    imagesBlock.innerHTML = "";
    imagesCounter = 0;
    document.querySelector(".submitImages").style.display = "none"
}


function deleteImage(id){
    console.log("image deleted =)")
    let formdata = new FormData(document.querySelector(".deleteImg" + id));
    /*let successBlock = document.querySelector(".successDeletedImg" + id)
    let unsucessBlock = document.querySelector(".unsucessDeletedImg" + id) */
    fetch('/images/delete/' + id, {
        method: 'POST',
        body: formdata
    }).then(response => {
        return response.text()
    }).then(response => {
        console.log(response)
        if (response == "true"){
            document.querySelector(".image" + id).innerHTML = "";
        } else {
            // unsucessBlock.style.display = "block";

        }
    })
}

function editReveal(){
    let elements = Array.from(document.getElementsByClassName("hidden"))
    elements.forEach((element, i, elements) => {
        element.classList.remove("hidden")
        element.classList.add("unhidden")
    })
}

function finishEdit(){
    let elements = Array.from(document.getElementsByClassName("unhidden"))
    elements.forEach((element, i, elements) => {
        element.classList.remove("unhidden")
        element.classList.add("hidden")
    })

    imagesBlock.innerHTML = "";
    imagesCounter = 0;
    document.querySelector(".submitImages").style.display = "none"
}

function saveChanges(){
    let form = new FormData(document.querySelector(".mainform"))
    form.submit()

    imagesBlock.innerHTML = "";
    imagesCounter = 0;
    document.querySelector(".submitImages").style.display = "none"
}
// ============================================================================================================

function onSubmitActions(){
    let searchQueryBlock = document.querySelector(".searchQueryBlock");
    let searchQuery = document.querySelector("#searchQuery");
    if (searchQuery.value == ""){
        searchQueryBlock.innerHTML = "";
    }

    let priceFrom = document.querySelector(".blockFrom")
    let fromValue = document.querySelector("#from")
    if (fromValue.value == ""){
        priceFrom.innerHTML = "";
    }

    let priceTo = document.querySelector(".blockTo")
    let toValue = document.querySelector("#to")
    if (toValue.value == ""){
        priceTo.innerHTML = "";
    }
}
function clearCurrentPage(){
    let currentPageBlock = document.querySelector(".currentPageBlock");
    currentPageBlock.innerHTML = "";
}
