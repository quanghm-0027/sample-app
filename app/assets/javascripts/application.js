//= require jquery
//= require bootstrap
//= require rails-ujs
//= require activestorage
//= require turbolinks
$(document).ready(() => {
    $("#micropost_picture").bind("change", function() {
        var size_in_megabytes = this.files[0].size/1024/1024;
        if (size_in_megabytes > 5) {
            alert(t("big_size"));
        }
    });
})
