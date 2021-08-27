<!-- default badges list -->
[![](https://img.shields.io/badge/Open_in_DevExpress_Support_Center-FF7200?style=flat-square&logo=DevExpress&logoColor=white)](https://supportcenter.devexpress.com/ticket/details/E94)
[![](https://img.shields.io/badge/📖_How_to_use_DevExpress_Examples-e9f6fc?style=flat-square)](https://docs.devexpress.com/GeneralInformation/403183)
<!-- default badges end -->
<!-- default file list -->
*Files to look at*:

* [Default.aspx](./CS/WebSite/Default.aspx) (VB: [Default.aspx](./VB/WebSite/Default.aspx))
* [Default.aspx.cs](./CS/WebSite/Default.aspx.cs) (VB: [Default.aspx.vb](./VB/WebSite/Default.aspx.vb))
<!-- default file list end -->
# Use AJAX Extenders in the EditForm template
<!-- run online -->
**[[Run Online]](https://codecentral.devexpress.com/e94)**
<!-- run online end -->


<p>This demo demonstrates how to use AJAX Extenders in the EditForm template.<br />
First of all, you need to embed the grid into an UpdatePanel's ContentTemplate and set the grid's EnableCallbacks property to false.<br />
Additionally, there is a trick for registering the required JavaScript/CSS files on the first page load (this may not be registered automatically since the edit form is initially hidden). To achieve this, apply the same extender class to an invisible control.</p>

<br/>


