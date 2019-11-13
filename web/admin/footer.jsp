<%-- 
    Document   : footer
    Created on : Oct 27, 2019, 10:21:53 AM
    Author     : KhoiLeQuoc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<div class="sidenav-overlay"></div>
<div class="drag-target"></div>

<!-- BEGIN: Footer-->
<footer class="footer footer-static footer-light">
    <p class="clearfix blue-grey lighten-2 mb-0"><span class="float-md-left d-block d-md-inline-block mt-25">COPYRIGHT &copy; 2019<a class="text-bold-800 grey darken-2" href="https://1.envato.market/pixinvent_portfolio" target="_blank">Pixinvent,</a>All rights Reserved</span><span class="float-md-right d-none d-md-block">Hand-crafted & Made with<i class="feather icon-heart pink"></i></span>
        <button class="btn btn-primary btn-icon scroll-top" type="button"><i class="feather icon-arrow-up"></i></button>
    </p>
</footer>
<!-- END: Footer-->


<!-- BEGIN: Vendor JS-->
<script src="../admin/app-assets/vendors/js/vendors.min.js"></script>
<!-- BEGIN Vendor JS-->

<!-- BEGIN: Page Vendor JS-->
<script src="../admin/app-assets/vendors/js/extensions/dropzone.min.js"></script>
<script src="../admin/app-assets/vendors/js/tables/datatable/datatables.min.js"></script>
<script src="../admin/app-assets/vendors/js/tables/datatable/datatables.buttons.min.js"></script>
<script src="../admin/app-assets/vendors/js/tables/datatable/datatables.bootstrap4.min.js"></script>
<script src="../admin/app-assets/vendors/js/tables/datatable/buttons.bootstrap.min.js"></script>
<script src="../admin/app-assets/vendors/js/tables/datatable/datatables.checkboxes.min.js"></script>
<!-- END: Page Vendor JS-->

<!-- BEGIN: Theme JS-->
<script src="../admin/app-assets/js/core/app-menu.js"></script>
<script src="../admin/app-assets/js/core/app.js"></script>
<script src="../admin/app-assets/js/scripts/components.js"></script>
<!-- END: Theme JS-->

<!-- BEGIN: Page JS-->
<script src="../admin/app-assets/js/scripts/ui/data-list-view.js"></script>
<!-- END: Page JS-->
<script>
    $(document).ready(function () {
        var currentURL = window.location.href;
        var listHref = $('li a');
        for (var i = 0; i < listHref.length; i++) {
            var href = listHref[i].href;
            if (currentURL == href) {   
                var parent = listHref[i].parentElement;
                parent.className = "active";
            }
        }
    });
</script>