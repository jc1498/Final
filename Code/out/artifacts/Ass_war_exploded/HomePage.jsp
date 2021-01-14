<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>


<!DOCTYPE html>
<html lang="en">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.min.css">

<head>
    <title>
        X-Trade Home Page
    </title>

    <style>
        html{-ms-text-size-adjust:100%;-webkit-text-size-adjust:100%}body{margin:0}
        article,aside,details,figcaption,figure,footer,header,main,menu,nav,section,summary{display:block}
        audio,canvas,progress,video{display:inline-block}progress{vertical-align:baseline}
        audio:not([controls]){display:none;height:0}[hidden],template{display:none}
        a{background-color:transparent;-webkit-text-decoration-skip:objects}
        a:active,a:hover{outline-width:0}abbr[title]{border-bottom:none;text-decoration:underline;text-decoration:underline dotted}
        dfn{font-style:italic}mark{background:#ff0;color:#000}
        small{font-size:80%}sub,sup{font-size:75%;line-height:0;position:relative;vertical-align:baseline}
        sub{bottom:-0.25em}sup{top:-0.5em}figure{margin:1em 40px}
        img{border-style:none}svg:not(:root){overflow:hidden}
        code,kbd,pre,samp{font-family:monospace,monospace;font-size:1em}
        hr{box-sizing:content-box;height:0;overflow:visible}
        button,input,select,textarea{font:inherit;margin:0}optgroup{font-weight:bold}
        button,input{overflow:visible}button,select{text-transform:none}
        button,html [type=button],[type=reset],[type=submit]{-webkit-appearance:button}
        button::-moz-focus-inner, [type=button]::-moz-focus-inner, [type=reset]::-moz-focus-inner, [type=submit]::-moz-focus-inner{border-style:none;padding:0}
        button:-moz-focusring, [type=button]:-moz-focusring, [type=reset]:-moz-focusring, [type=submit]:-moz-focusring{outline:1px dotted ButtonText}
        fieldset{border:1px solid #c0c0c0;margin:0 2px;padding:.35em .625em .75em}
        legend{color:inherit;display:table;max-width:100%;padding:0;white-space:normal}textarea{overflow:auto}
        [type=checkbox],[type=radio]{padding:0}
        [type=number]::-webkit-inner-spin-button,[type=number]::-webkit-outer-spin-button{height:auto}
        [type=search]{-webkit-appearance:textfield;outline-offset:-2px}
        [type=search]::-webkit-search-cancel-button,[type=search]::-webkit-search-decoration{-webkit-appearance:none}
        ::-webkit-input-placeholder{color:inherit;opacity:0.54}
        ::-webkit-file-upload-button{-webkit-appearance:button;font:inherit}
        /* End extract */
        html,body{font-family:Verdana,sans-serif;font-size:15px;line-height:1.5}html{overflow-x:hidden}
        h1,h2,h3,h4,h5,h6,.w3-slim,.w3-wide{font-family:"Segoe UI",Arial,sans-serif}
        h1{font-size:36px}h2{font-size:30px}h3{font-size:24px}h4{font-size:20px}h5{font-size:18px}h6{font-size:16px}
        .w3-serif{font-family:"Times New Roman",Times,serif}
        h1,h2,h3,h4,h5,h6{font-weight:400;margin:10px 0}.w3-wide{letter-spacing:4px}
        h1 a,h2 a,h3 a,h4 a,h5 a,h6 a{font-weight:inherit}
        hr{border:0;border-top:1px solid #eee;margin:20px 0}
        img{margin-bottom:-5px}a{color:inherit}
        .w3-image{max-width:100%;height:auto}
        .w3-table,.w3-table-all{border-collapse:collapse;border-spacing:0;width:100%;display:table}
        .w3-table-all{border:1px solid #ccc}
        .w3-bordered tr,.w3-table-all tr{border-bottom:1px solid #ddd}
        .w3-striped tbody tr:nth-child(even){background-color:#f1f1f1}
        .w3-table-all tr:nth-child(odd){background-color:#fff}
        .w3-table-all tr:nth-child(even){background-color:#f1f1f1}
        .w3-hoverable tbody tr:hover,.w3-ul.w3-hoverable li:hover{background-color:#ccc}
        .w3-centered tr th,.w3-centered tr td{text-align:center}
        .w3-table td,.w3-table th,.w3-table-all td,.w3-table-all th{padding:8px 8px;display:table-cell;text-align:left;vertical-align:top}
        .w3-table th:first-child,.w3-table td:first-child,.w3-table-all th:first-child,.w3-table-all td:first-child{padding-left:16px}
        .w3-btn,.w3-btn-block,.w3-button{border:none;display:inline-block;outline:0;padding:6px 16px;vertical-align:middle;overflow:hidden;text-decoration:none!important;color:#fff;background-color:#000;text-align:center;cursor:pointer;white-space:nowrap}
        .w3-btn:hover,.w3-btn-block:hover,.w3-btn-floating:hover,.w3-btn-floating-large:hover{box-shadow:0 8px 16px 0 rgba(0,0,0,0.2),0 6px 20px 0 rgba(0,0,0,0.19)}
        .w3-button{color:#000;background-color:#f1f1f1;padding:8px 16px}.w3-button:hover{color:#000!important;background-color:#ccc!important}
        .w3-btn,.w3-btn-floating,.w3-btn-floating-large,.w3-closenav,.w3-opennav,.w3-btn-block,.w3-button{-webkit-touch-callout:none;-webkit-user-select:none;-khtml-user-select:none;-moz-user-select:none;-ms-user-select:none;user-select:none}
        .w3-btn-floating,.w3-btn-floating-large{display:inline-block;text-align:center;color:#fff;background-color:#000;position:relative;overflow:hidden;z-index:1;padding:0;border-radius:50%;cursor:pointer;font-size:24px}
        .w3-btn-floating{width:40px;height:40px;line-height:40px}.w3-btn-floating-large{width:56px;height:56px;line-height:56px}
        .w3-disabled,.w3-btn:disabled,.w3-button:disabled,.w3-btn-floating:disabled,.w3-btn-floating-large:disabled{cursor:not-allowed;opacity:0.3}.w3-disabled *,:disabled *{pointer-events:none}
        .w3-btn.w3-disabled:hover,.w3-btn-block.w3-disabled:hover,.w3-btn:disabled:hover,.w3-btn-floating.w3-disabled:hover,.w3-btn-floating:disabled:hover,
        .w3-btn-floating-large.w3-disabled:hover,.w3-btn-floating-large:disabled:hover{box-shadow:none}
        .w3-btn-group .w3-btn{float:left}.w3-btn-block{width:100%}
        .w3-btn-bar .w3-btn{box-shadow:none;background-color:inherit;color:inherit;float:left}.w3-btn-bar .w3-btn:hover{background-color:#ccc}
        .w3-badge,.w3-tag,.w3-sign{background-color:#000;color:#fff;display:inline-block;padding-left:8px;padding-right:8px;text-align:center}
        .w3-badge{border-radius:50%}
        ul.w3-ul{list-style-type:none;padding:0;margin:0}ul.w3-ul li{padding:8px 16px;border-bottom:1px solid #ddd}ul.w3-ul li:last-child{border-bottom:none}
        .w3-tooltip,.w3-display-container{position:relative}.w3-tooltip .w3-text{display:none}.w3-tooltip:hover .w3-text{display:inline-block}
        .w3-navbar{list-style-type:none;margin:0;padding:0;overflow:hidden}
        .w3-navbar li{float:left}.w3-navbar li a,.w3-navitem,.w3-navbar li .w3-btn,.w3-navbar li .w3-input{display:block;padding:8px 16px}.w3-navbar li .w3-btn,.w3-navbar li .w3-input{border:none;outline:none;width:100%}
        .w3-navbar li a:hover{color:#000;background-color:#ccc}
        .w3-navbar .w3-dropdown-hover,.w3-navbar .w3-dropdown-click{position:static}
        .w3-navbar .w3-dropdown-hover:hover,.w3-navbar .w3-dropdown-hover:first-child,.w3-navbar .w3-dropdown-click:hover{background-color:#ccc;color:#000}
        .w3-navbar a,.w3-topnav a,.w3-sidenav a,.w3-dropdown-content a,.w3-accordion-content a,.w3-dropnav a,.w3-navblock a{text-decoration:none!important}
        .w3-navbar .w3-opennav.w3-right{float:right!important}.w3-topnav{padding:8px 8px}
        .w3-navblock .w3-dropdown-hover:hover,.w3-navblock .w3-dropdown-hover:first-child,.w3-navblock .w3-dropdown-click:hover{background-color:#ccc;color:#000}
        .w3-navblock .w3-dropdown-hover,.w3-navblock .w3-dropdown-click{width:100%}.w3-navblock .w3-dropdown-hover .w3-dropdown-content,.w3-navblock .w3-dropdown-click .w3-dropdown-content{min-width:100%}
        .w3-topnav a{padding:8 8px;border-bottom:3px solid transparent;-webkit-transition:border-bottom .25s;transition:border-bottom .25s}
        .w3-topnav a:hover{border-bottom:3px solid #fff}.w3-topnav .w3-dropdown-hover a{border-bottom:0}
        .w3-opennav,.w3-closenav{color:inherit}.w3-opennav:hover,.w3-closenav:hover{cursor:pointer;opacity:0.8}
        .w3-btn,.w3-btn-floating,.w3-dropnav a,.w3-btn-floating-large,.w3-btn-block, .w3-navbar a,.w3-navblock a,.w3-sidenav a,.w3-pagination li a,.w3-hoverable tbody tr,.w3-hoverable li,
        .w3-accordion-content a,.w3-dropdown-content a,.w3-dropdown-click:hover,.w3-dropdown-hover:hover,.w3-opennav,.w3-closenav,.w3-closebtn,[class="w3-hover-"]
        {-webkit-transition:background-color .25s,color .15s,box-shadow .25s,opacity 0.25s,filter 0.25s,border 0.15s;transition:background-color .25s,color .15s,box-shadow .15s,opacity .25s,filter .25s,border .15s}
        .w3-ripple:active{opacity:0.5}.w3-ripple{-webkit-transition:opacity 0s;transition:opacity 0s}
        .w3-sidenav,.w3-sidebar{height:100%;width:200px;background-color:#fff;position:fixed!important;z-index:1;overflow:auto}
        .w3-sidenav a,.w3-navblock a{padding:4px 2px 4px 16px}.w3-sidenav a:hover,.w3-navblock a:hover{background-color:#ccc;color:#000}.w3-sidenav a,.w3-dropnav a,.w3-navblock a{display:block}
        .w3-sidenav .w3-dropdown-hover:hover,.w3-sidenav .w3-dropdown-hover:first-child,.w3-sidenav .w3-dropdown-click:hover,.w3-dropnav a:hover{background-color:#ccc;color:#000}
        .w3-sidenav .w3-dropdown-hover,.w3-sidenav .w3-dropdown-click,.w3-bar-block .w3-dropdown-hover,.w3-bar-block .w3-dropdown-click{width:100%}
        .w3-sidenav .w3-dropdown-hover .w3-dropdown-content,.w3-sidenav .w3-dropdown-click .w3-dropdown-content,.w3-bar-block .w3-dropdown-hover .w3-dropdown-content,.w3-bar-block .w3-dropdown-click .w3-dropdown-content{min-width:100%}
        .w3-bar-block .w3-dropdown-hover .w3-button,.w3-bar-block .w3-dropdown-click .w3-button{width:100%;text-align:left;background-color:inherit;color:inherit;padding:8px 16px}
        .w3-main,#main{transition:margin-left .4s}
        .w3-modal{z-index:3;display:none;padding-top:100px;position:fixed;left:0;top:0;width:100%;height:100%;overflow:auto;background-color:rgb(0,0,0);background-color:rgba(0,0,0,0.4)}
        .w3-modal-content{margin:auto;background-color:#fff;position:relative;padding:0;outline:0;width:600px}.w3-closebtn{text-decoration:none;float:right;font-size:24px;font-weight:bold;color:inherit}
        .w3-closebtn:hover,.w3-closebtn:focus{color:#000;text-decoration:none;cursor:pointer}
        .w3-pagination{display:inline-block;padding:0;margin:0}.w3-pagination li{display:inline}
        .w3-pagination li a{text-decoration:none;color:#000;float:left;padding:8px 16px}
        .w3-pagination li a:hover{background-color:#ccc}
        .w3-input-group,.w3-group{margin-top:24px;margin-bottom:24px}
        .w3-input{padding:8px;display:block;border:none;border-bottom:1px solid #808080;width:100%}
        .w3-label{color:#009688}.w3-input:not(:valid)~.w3-validate{color:#f44336}
        .w3-select{padding:9px 0;width:100%;color:#000;border:1px solid transparent;border-bottom:1px solid #009688}
        .w3-select select:focus{color:#000;border:1px solid #009688}.w3-select option[disabled]{color:#009688}
        .w3-dropdown-click,.w3-dropdown-hover{position:relative;display:inline-block;cursor:pointer}
        .w3-dropdown-hover:hover .w3-dropdown-content{display:block;z-index:1}
        .w3-dropdown-hover:first-child,.w3-dropdown-click:hover{background-color:#ccc;color:#000}
        .w3-dropdown-hover:hover > .w3-button:first-child,.w3-dropdown-click:hover > .w3-button:first-child{background-color:#ccc;color:#000}
        .w3-dropdown-content{cursor:auto;color:#000;background-color:#fff;display:none;position:absolute;min-width:160px;margin:0;padding:0}
        .w3-dropdown-content a{padding:6px 16px;display:block}
        .w3-dropdown-content a:hover{background-color:#ccc}
        .w3-accordion{width:100%;cursor:pointer}
        .w3-accordion-content{cursor:auto;display:none;position:relative;width:100%;margin:0;padding:0}
        .w3-accordion-content a{padding:6px 16px;display:block}.w3-accordion-content a:hover{background-color:#ccc}
        .w3-progress-container{width:100%;height:1.5em;position:relative;background-color:#f1f1f1}
        .w3-progressbar{background-color:#757575;height:100%;position:absolute;line-height:inherit}
        input[type=checkbox].w3-check,input[type=radio].w3-radio{width:24px;height:24px;position:relative;top:6px}
        input[type=checkbox].w3-check:checked+.w3-validate,input[type=radio].w3-radio:checked+.w3-validate{color:#009688}
        input[type=checkbox].w3-check:disabled+.w3-validate,input[type=radio].w3-radio:disabled+.w3-validate{color:#aaa}
        .w3-bar{width:100%;overflow:hidden}.w3-center .w3-bar{display:inline-block;width:auto}
        .w3-bar .w3-bar-item{padding:8px 16px;float:left;background-color:inherit;color:inherit;width:auto;border:none;outline:none;display:block}
        .w3-bar .w3-dropdown-hover,.w3-bar .w3-dropdown-click{position:static;float:left}
        .w3-bar .w3-button{background-color:inherit;color:inherit;white-space:normal}
        .w3-bar-block .w3-bar-item{width:100%;display:block;padding:8px 16px;text-align:left;background-color:inherit;color:inherit;border:none;outline:none;white-space:normal;float:none}
        .w3-bar-block.w3-center .w3-bar-item{text-align:center}
        .w3-block{display:block;width:100%}
        .w3-responsive{overflow-x:auto}
        .w3-container:after,.w3-container:before,.w3-panel:after,.w3-panel:before,.w3-row:after,.w3-row:before,.w3-row-padding:after,.w3-row-padding:before,.w3-cell-row:before,.w3-cell-row:after,
        .w3-topnav:after,.w3-topnav:before,.w3-clear:after,.w3-clear:before,.w3-btn-group:before,.w3-btn-group:after,.w3-btn-bar:before,.w3-btn-bar:after,.w3-bar:before,.w3-bar:after
        {content:"";display:table;clear:both}

        @media (min-width:601px){
            .w3-col.m1{width:8.33333%}
            .w3-col.m2{width:16.66666%}
            .w3-col.m3,.w3-quarter{width:24.99999%}
            .w3-col.m4,.w3-third{width:33.33333%}
            .w3-col.m5{width:41.66666%}
            .w3-col.m6,.w3-half{width:49.99999%}
            .w3-col.m7{width:58.33333%}
            .w3-col.m8,.w3-twothird{width:66.66666%}
            .w3-col.m9,.w3-threequarter{width:74.99999%}
            .w3-col.m10{width:83.33333%}
            .w3-col.m11{width:91.66666%}
            .w3-col.m12{width:99.99999%}}
        @media (min-width:993px){
            .w3-col.l1{width:8.33333%}
            .w3-col.l2{width:16.66666%}
            .w3-col.l3,.w3-quarter{width:24.99999%}
            .w3-col.l4,.w3-third{width:33.33333%}
            .w3-col.l5{width:41.66666%}
            .w3-col.l6,.w3-half{width:49.99999%}
            .w3-col.l7{width:58.33333%}
            .w3-col.l8,.w3-twothird{width:66.66666%}
            .w3-col.l9,.w3-threequarter{width:74.99999%}
            .w3-col.l10{width:83.33333%}
            .w3-col.l11{width:91.66666%}
            .w3-col.l12{width:99.99999%}}
        .w3-content{max-width:980px;margin:auto}
        .w3-rest{overflow:hidden}
        .w3-layout-container,.w3-cell-row{display:table;width:100%}.w3-layout-row{display:table-row}.w3-layout-cell,.w3-layout-col,.w3-cell{display:table-cell}
        .w3-layout-top,.w3-cell-top{vertical-align:top}.w3-layout-middle,.w3-cell-middle{vertical-align:middle}.w3-layout-bottom,.w3-cell-bottom{vertical-align:bottom}
        .w3-hide{display:none!important}.w3-show-block,.w3-show{display:block!important}.w3-show-inline-block{display:inline-block!important}
        @media (max-width:600px){.w3-modal-content{margin:0 10px;width:auto!important}.w3-modal{padding-top:30px}
            .w3-topnav a{display:block}.w3-navbar li:not(.w3-opennav){float:none;width:100%!important}.w3-navbar li.w3-right{float:none!important}
            .w3-topnav .w3-dropdown-hover .w3-dropdown-content,.w3-navbar .w3-dropdown-click .w3-dropdown-content,.w3-navbar .w3-dropdown-hover .w3-dropdown-content,.w3-dropdown-hover.w3-mobile .w3-dropdown-content,.w3-dropdown-click.w3-mobile .w3-dropdown-content{position:relative}
            .w3-topnav,.w3-navbar{text-align:center}.w3-hide-small{display:none!important}.w3-layout-col,.w3-mobile{display:block;width:100%!important}.w3-bar-item.w3-mobile,.w3-dropdown-hover.w3-mobile,.w3-dropdown-click.w3-mobile{text-align:center}
            .w3-dropdown-hover.w3-mobile,.w3-dropdown-hover.w3-mobile .w3-btn,.w3-dropdown-hover.w3-mobile .w3-button,.w3-dropdown-click.w3-mobile,.w3-dropdown-click.w3-mobile .w3-btn,.w3-dropdown-click.w3-mobile .w3-button{width:100%}}
        @media (max-width:768px){.w3-modal-content{width:500px}.w3-modal{padding-top:50px}}
        @media (min-width:993px){.w3-modal-content{width:900px}.w3-hide-large{display:none!important}.w3-sidenav.w3-collapse,.w3-sidebar.w3-collapse{display:block!important}}
        @media (max-width:992px) and (min-width:601px){.w3-hide-medium{display:none!important}}
        @media (max-width:992px){.w3-sidenav.w3-collapse,.w3-sidebar.w3-collapse{display:none}.w3-main{margin-left:0!important;margin-right:0!important}}
        .w3-top,.w3-bottom{position:fixed;width:100%;z-index:1}.w3-top{top:0}.w3-bottom{bottom:0}
        .w3-overlay{position:fixed;display:none;width:100%;height:100%;top:0;left:0;right:0;bottom:0;background-color:rgba(0,0,0,0.5);z-index:2}
        .w3-left{float:left!important}.w3-right{float:right!important}
        .w3-tiny{font-size:10px!important}.w3-small{font-size:12px!important}
        .w3-medium{font-size:15px!important}.w3-large{font-size:18px!important}
        .w3-xlarge{font-size:24px!important}.w3-xxlarge{font-size:36px!important}
        .w3-xxxlarge{font-size:48px!important}.w3-jumbo{font-size:64px!important}
        .w3-vertical{word-break:break-all;line-height:1;text-align:center;width:0.6em}
        .w3-left-align{text-align:left!important}.w3-right-align{text-align:right!important}
        .w3-justify{text-align:justify!important}.w3-center{text-align:center!important}
        .w3-display-topleft{position:absolute;left:0;top:0}.w3-display-topright{position:absolute;right:0;top:0}
        .w3-display-bottomleft{position:absolute;left:0;bottom:0}.w3-display-bottomright{position:absolute;right:0;bottom:0}
        .w3-display-middle{position:absolute;top:50%;left:50%;transform:translate(-50%,-50%);-ms-transform:translate(-50%,-50%)}
        .w3-display-left{position:absolute;top:50%;left:0%;transform:translate(0%,-50%);-ms-transform:translate(-0%,-50%)}
        .w3-display-right{position:absolute;top:50%;right:0%;transform:translate(0%,-50%);-ms-transform:translate(0%,-50%)}
        .w3-display-topmiddle{position:absolute;left:50%;top:0;transform:translate(-50%,0%);-ms-transform:translate(-50%,0%)}
        .w3-display-bottommiddle{position:absolute;left:50%;bottom:0;transform:translate(-50%,0%);-ms-transform:translate(-50%,0%)}
        .w3-display-container:hover .w3-display-hover{display:block}.w3-display-container:hover span.w3-display-hover{display:inline-block}.w3-display-hover{display:none}
        .w3-display-position{position:absolute}
        .w3-circle{border-radius:50%!important}
        .w3-round-small{border-radius:2px!important}.w3-round,.w3-round-medium{border-radius:4px!important}
        .w3-round-large{border-radius:8px!important}.w3-round-xlarge{border-radius:16px!important}
        .w3-round-xxlarge{border-radius:32px!important}.w3-round-jumbo{border-radius:64px!important}
        .w3-border-0{border:0!important}.w3-border{border:1px solid #ccc!important}
        .w3-border-top{border-top:1px solid #ccc!important}.w3-border-bottom{border-bottom:1px solid #ccc!important}
        .w3-border-left{border-left:1px solid #ccc!important}.w3-border-right{border-right:1px solid #ccc!important}
        .w3-margin{margin:16px!important}.w3-margin-0{margin:0!important}
        .w3-margin-top{margin-top:16px!important}.w3-margin-bottom{margin-bottom:16px!important}
        .w3-margin-left{margin-left:16px!important}.w3-margin-right{margin-right:16px!important}
        .w3-section{margin-top:16px!important;margin-bottom:16px!important}
        .w3-padding-tiny{padding:2px 4px!important}.w3-padding-small{padding:4px 8px!important}
        .w3-padding-medium,.w3-padding,.w3-form{padding:8px 16px!important}
        .w3-padding-large{padding:12px 24px!important}.w3-padding-xlarge{padding:16px 32px!important}
        .w3-padding-xxlarge{padding:24px 48px!important}.w3-padding-jumbo{padding:32px 64px!important}
        .w3-padding-4{padding-top:4px!important;padding-bottom:4px!important}
        .w3-padding-8{padding-top:8px!important;padding-bottom:8px!important}
        .w3-padding-12{padding-top:12px!important;padding-bottom:12px!important}
        .w3-padding-16{padding-top:16px!important;padding-bottom:16px!important}
        .w3-padding-24{padding-top:24px!important;padding-bottom:24px!important}
        .w3-padding-32{padding-top:32px!important;padding-bottom:32px!important}
        .w3-padding-48{padding-top:48px!important;padding-bottom:48px!important}
        .w3-padding-64{padding-top:64px!important;padding-bottom:64px!important}
        .w3-padding-128{padding-top:128px!important;padding-bottom:128px!important}
        .w3-padding-0{padding:0!important}
        .w3-padding-top{padding-top:8px!important}.w3-padding-bottom{padding-bottom:8px!important}
        .w3-padding-left{padding-left:16px!important}.w3-padding-right{padding-right:16px!important}
        .w3-topbar{border-top:6px solid #ccc!important}.w3-bottombar{border-bottom:6px solid #ccc!important}
        .w3-leftbar{border-left:6px solid #ccc!important}.w3-rightbar{border-right:6px solid #ccc!important}
        .w3-row-padding,.w3-row-padding>.w3-half,.w3-row-padding>.w3-third,.w3-row-padding>.w3-twothird,.w3-row-padding>.w3-threequarter,.w3-row-padding>.w3-quarter,.w3-row-padding>.w3-col{padding:0 8px}
        .w3-spin{animation:w3-spin 2s infinite linear;-webkit-animation:w3-spin 2s infinite linear}
        @-webkit-keyframes w3-spin{0%{-webkit-transform:rotate(0deg);transform:rotate(0deg)}100%{-webkit-transform:rotate(359deg);transform:rotate(359deg)}}
        @keyframes w3-spin{0%{-webkit-transform:rotate(0deg);transform:rotate(0deg)}100%{-webkit-transform:rotate(359deg);transform:rotate(359deg)}}
        .w3-container{padding:0.01em 16px}
        .w3-panel{padding:0.01em 16px;margin-top:16px!important;margin-bottom:16px!important}
        .w3-example{background-color:#f1f1f1;padding:0.01em 16px}
        .w3-code,.w3-codespan{font-family:Consolas,"courier new";font-size:16px}
        .w3-code{line-height:1.4;width:auto;background-color:#fff;padding:8px 12px;border-left:4px solid #4CAF50;word-wrap:break-word}
        .w3-codespan{color:crimson;background-color:#f1f1f1;padding-left:4px;padding-right:4px;font-size:110%}
        .w3-example,.w3-code{margin:20px 0}
        .w3-card,.w3-card-2,.w3-example{box-shadow:0 2px 4px 0 rgba(0,0,0,0.16),0 2px 10px 0 rgba(0,0,0,0.12)!important}
        .w3-card-4,.w3-hover-shadow:hover{box-shadow:0 4px 8px 0 rgba(0,0,0,0.2),0 6px 20px 0 rgba(0,0,0,0.19)!important}
        .w3-card-8{box-shadow:0 8px 16px 0 rgba(0,0,0,0.2),0 6px 20px 0 rgba(0,0,0,0.19)!important}
        .w3-card-12{box-shadow:0 12px 16px 0 rgba(0,0,0,0.24),0 17px 50px 0 rgba(0,0,0,0.19)!important}
        .w3-card-16{box-shadow:0 16px 24px 0 rgba(0,0,0,0.22),0 25px 55px 0 rgba(0,0,0,0.21)!important}
        .w3-card-24{box-shadow:0 24px 24px 0 rgba(0,0,0,0.2),0 40px 77px 0 rgba(0,0,0,0.22)!important}
        .w3-animate-fading{-webkit-animation:fading 10s infinite;animation:fading 10s infinite}
        @-webkit-keyframes fading{0%{opacity:0}50%{opacity:1}100%{opacity:0}}
        @keyframes fading{0%{opacity:0}50%{opacity:1}100%{opacity:0}}
        .w3-animate-opacity{-webkit-animation:opac 0.8s;animation:opac 0.8s}
        @-webkit-keyframes opac{from{opacity:0} to{opacity:1}}
        @keyframes opac{from{opacity:0} to{opacity:1}}
        .w3-animate-top{position:relative;-webkit-animation:animatetop 0.4s;animation:animatetop 0.4s}
        @-webkit-keyframes animatetop{from{top:-300px;opacity:0} to{top:0;opacity:1}}
        @keyframes animatetop{from{top:-300px;opacity:0} to{top:0;opacity:1}}
        .w3-animate-left{position:relative;-webkit-animation:animateleft 0.4s;animation:animateleft 0.4s}
        @-webkit-keyframes animateleft{from{left:-300px;opacity:0} to{left:0;opacity:1}}
        @keyframes animateleft{from{left:-300px;opacity:0} to{left:0;opacity:1}}
        .w3-animate-right{position:relative;-webkit-animation:animateright 0.4s;animation:animateright 0.4s}
        @-webkit-keyframes animateright{from{right:-300px;opacity:0} to{right:0;opacity:1}}
        @keyframes animateright{from{right:-300px;opacity:0} to{right:0;opacity:1}}
        .w3-animate-bottom{position:relative;-webkit-animation:animatebottom 0.4s;animation:animatebottom 0.4s}
        @-webkit-keyframes animatebottom{from{bottom:-300px;opacity:0} to{bottom:0px;opacity:1}}
        @keyframes animatebottom{from{bottom:-300px;opacity:0} to{bottom:0;opacity:1}}
        .w3-animate-zoom {-webkit-animation:animatezoom 0.6s;animation:animatezoom 0.6s}
        @-webkit-keyframes animatezoom{from{-webkit-transform:scale(0)} to{-webkit-transform:scale(1)}}
        @keyframes animatezoom{from{transform:scale(0)} to{transform:scale(1)}}
        .w3-animate-input{-webkit-transition:width 0.4s ease-in-out;transition:width 0.4s ease-in-out}.w3-animate-input:focus{width:100%!important}
        .w3-opacity,.w3-hover-opacity:hover{opacity:0.60;-webkit-backface-visibility:hidden}
        .w3-opacity-off,.w3-hover-opacity-off:hover{opacity:1;-webkit-backface-visibility:hidden}
        .w3-opacity-max{opacity:0.25;-webkit-backface-visibility:hidden}
        .w3-opacity-min{opacity:0.75;-webkit-backface-visibility:hidden}
        .w3-greyscale-max,.w3-grayscale-max,.w3-hover-greyscale:hover,.w3-hover-grayscale:hover{-webkit-filter:grayscale(100%);filter:grayscale(100%)}
        .w3-greyscale,.w3-grayscale{-webkit-filter:grayscale(75%);filter:grayscale(75%)}
        .w3-greyscale-min,.w3-grayscale-min{-webkit-filter:grayscale(50%);filter:grayscale(50%)}
        .w3-sepia{-webkit-filter:sepia(75%);filter:sepia(75%)}
        .w3-sepia-max,.w3-hover-sepia:hover{-webkit-filter:sepia(100%);filter:sepia(100%)}
        .w3-sepia-min{-webkit-filter:sepia(50%);filter:sepia(50%)}
        .w3-text-shadow{text-shadow:1px 1px 0 #444}.w3-text-shadow-white{text-shadow:1px 1px 0 #ddd}
        .w3-transparent{background-color:transparent!important}
        .w3-hover-none:hover{box-shadow:none!important;background-color:transparent!important}
        /* Colors */
        .w3-amber,.w3-hover-amber:hover{color:#000!important;background-color:#ffc107!important}
        .w3-aqua,.w3-hover-aqua:hover{color:#000!important;background-color:#00ffff!important}
        .w3-blue,.w3-hover-blue:hover{color:#fff!important;background-color:#2196F3!important}
        .w3-light-blue,.w3-hover-light-blue:hover{color:#000!important;background-color:#87CEEB!important}
        .w3-brown,.w3-hover-brown:hover{color:#fff!important;background-color:#795548!important}
        .w3-cyan,.w3-hover-cyan:hover{color:#000!important;background-color:#00bcd4!important}
        .w3-blue-grey,.w3-hover-blue-grey:hover,.w3-blue-gray,.w3-hover-blue-gray:hover{color:#fff!important;background-color:#607d8b!important}
        .w3-green,.w3-hover-green:hover{color:#fff!important;background-color:#4CAF50!important}
        .w3-light-green,.w3-hover-light-green:hover{color:#000!important;background-color:#8bc34a!important}
        .w3-indigo,.w3-hover-indigo:hover{color:#fff!important;background-color:#3f51b5!important}
        .w3-khaki,.w3-hover-khaki:hover{color:#000!important;background-color:#f0e68c!important}
        .w3-lime,.w3-hover-lime:hover{color:#000!important;background-color:#cddc39!important}
        .w3-orange,.w3-hover-orange:hover{color:#000!important;background-color:#ff9800!important}
        .w3-deep-orange,.w3-hover-deep-orange:hover{color:#fff!important;background-color:#ff5722!important}
        .w3-pink,.w3-hover-pink:hover{color:#fff!important;background-color:#e91e63!important}
        .w3-purple,.w3-hover-purple:hover{color:#fff!important;background-color:#9c27b0!important}
        .w3-deep-purple,.w3-hover-deep-purple:hover{color:#fff!important;background-color:#673ab7!important}
        .w3-red,.w3-hover-red:hover{color:#fff!important;background-color:#f44336!important}
        .w3-sand,.w3-hover-sand:hover{color:#000!important;background-color:#fdf5e6!important}
        .w3-teal,.w3-hover-teal:hover{color:#fff!important;background-color:#009688!important}
        .w3-yellow,.w3-hover-yellow:hover{color:#000!important;background-color:#ffeb3b!important}
        .w3-white,.w3-hover-white:hover{color:#000!important;background-color:#fff!important}
        .w3-black,.w3-hover-black:hover{color:#fff!important;background-color:#000!important}
        .w3-grey,.w3-hover-grey:hover,.w3-gray,.w3-hover-gray:hover{color:#000!important;background-color:#9e9e9e!important}
        .w3-light-grey,.w3-hover-light-grey:hover,.w3-light-gray,.w3-hover-light-gray:hover{color:#000!important;background-color:#f1f1f1!important}
        .w3-dark-grey,.w3-hover-dark-grey:hover,.w3-dark-gray,.w3-hover-dark-gray:hover{color:#fff!important;background-color:#616161!important}
        .w3-pale-red,.w3-hover-pale-red:hover{color:#000!important;background-color:#ffdddd!important}
        .w3-pale-green,.w3-hover-pale-green:hover{color:#000!important;background-color:#ddffdd!important}
        .w3-pale-yellow,.w3-hover-pale-yellow:hover{color:#000!important;background-color:#ffffcc!important}
        .w3-pale-blue,.w3-hover-pale-blue:hover{color:#000!important;background-color:#ddffff!important}
        .w3-text-amber,.w3-hover-text-amber:hover{color:#ffc107!important}
        .w3-text-aqua,.w3-hover-text-aqua:hover{color:#00ffff!important}
        .w3-text-blue,.w3-hover-text-blue:hover{color:#2196F3!important}
        .w3-text-light-blue,.w3-hover-text-light-blue:hover{color:#87CEEB!important}
        .w3-text-brown,.w3-hover-text-brown:hover{color:#795548!important}
        .w3-text-cyan,.w3-hover-text-cyan:hover{color:#00bcd4!important}
        .w3-text-blue-grey,.w3-hover-text-blue-grey:hover,.w3-text-blue-gray,.w3-hover-text-blue-gray:hover{color:#607d8b!important}
        .w3-text-green,.w3-hover-text-green:hover{color:#4CAF50!important}
        .w3-text-light-green,.w3-hover-text-light-green:hover{color:#8bc34a!important}
        .w3-text-indigo,.w3-hover-text-indigo:hover{color:#3f51b5!important}
        .w3-text-khaki,.w3-hover-text-khaki:hover{color:#b4aa50!important}
        .w3-text-lime,.w3-hover-text-lime:hover{color:#cddc39!important}
        .w3-text-orange,.w3-hover-text-orange:hover{color:#ff9800!important}
        .w3-text-deep-orange,.w3-hover-text-deep-orange:hover{color:#ff5722!important}
        .w3-text-pink,.w3-hover-text-pink:hover{color:#e91e63!important}
        .w3-text-purple,.w3-hover-text-purple:hover{color:#9c27b0!important}
        .w3-text-deep-purple,.w3-hover-text-deep-purple:hover{color:#673ab7!important}
        .w3-text-red,.w3-hover-text-red:hover{color:#f44336!important}
        .w3-text-sand,.w3-hover-text-sand:hover{color:#fdf5e6!important}
        .w3-text-teal,.w3-hover-text-teal:hover{color:#009688!important}
        .w3-text-yellow,.w3-hover-text-yellow:hover{color:#d2be0e!important}
        .w3-text-white,.w3-hover-text-white:hover{color:#fff!important}
        .w3-text-black,.w3-hover-text-black:hover{color:#000!important}
        .w3-text-grey,.w3-hover-text-grey:hover,.w3-text-gray,.w3-hover-text-gray:hover{color:#757575!important}
        .w3-text-light-grey,.w3-hover-text-light-grey:hover,.w3-text-light-gray,.w3-hover-text-light-gray:hover{color:#f1f1f1!important}
        .w3-text-dark-grey,.w3-hover-text-dark-grey:hover,.w3-text-dark-gray,.w3-hover-text-dark-gray:hover{color:#3a3a3a!important}
        .w3-border-amber,.w3-hover-border-amber:hover{border-color:#ffc107!important}
        .w3-border-aqua,.w3-hover-border-aqua:hover{border-color:#00ffff!important}
        .w3-border-blue,.w3-hover-border-blue:hover{border-color:#2196F3!important}
        .w3-border-light-blue,.w3-hover-border-light-blue:hover{border-color:#87CEEB!important}
        .w3-border-brown,.w3-hover-border-brown:hover{border-color:#795548!important}
        .w3-border-cyan,.w3-hover-border-cyan:hover{border-color:#00bcd4!important}
        .w3-border-blue-grey,.w3-hover-border-blue-grey:hover,.w3-border-blue-gray,.w3-hover-border-blue-gray:hover{border-color:#607d8b!important}
        .w3-border-green,.w3-hover-border-green:hover{border-color:#4CAF50!important}
        .w3-border-light-green,.w3-hover-border-light-green:hover{border-color:#8bc34a!important}
        .w3-border-indigo,.w3-hover-border-indigo:hover{border-color:#3f51b5!important}
        .w3-border-khaki,.w3-hover-border-khaki:hover{border-color:#f0e68c!important}
        .w3-border-lime,.w3-hover-border-lime:hover{border-color:#cddc39!important}
        .w3-border-orange,.w3-hover-border-orange:hover{border-color:#ff9800!important}
        .w3-border-deep-orange,.w3-hover-border-deep-orange:hover{border-color:#ff5722!important}
        .w3-border-pink,.w3-hover-border-pink:hover{border-color:#e91e63!important}
        .w3-border-purple,.w3-hover-border-purple:hover{border-color:#9c27b0!important}
        .w3-border-deep-purple,.w3-hover-border-deep-purple:hover{border-color:#673ab7!important}
        .w3-border-red,.w3-hover-border-red:hover{border-color:#f44336!important}
        .w3-border-sand,.w3-hover-border-sand:hover{border-color:#fdf5e6!important}
        .w3-border-teal,.w3-hover-border-teal:hover{border-color:#009688!important}
        .w3-border-yellow,.w3-hover-border-yellow:hover{border-color:#ffeb3b!important}
        .w3-border-white,.w3-hover-border-white:hover{border-color:#fff!important}
        .w3-border-black,.w3-hover-border-black:hover{border-color:#000!important}
        .w3-border-grey,.w3-hover-border-grey:hover,.w3-border-gray,.w3-hover-border-gray:hover{border-color:#9e9e9e!important}
        .w3-border-light-grey,.w3-hover-border-light-grey:hover,.w3-border-light-gray,.w3-hover-border-light-gray:hover{border-color:#f1f1f1!important}
        .w3-border-dark-grey,.w3-hover-border-dark-grey:hover,.w3-border-dark-gray,.w3-hover-border-dark-gray:hover{border-color:#616161!important}
        .w3-border-pale-red,.w3-hover-border-pale-red:hover{border-color:#ffe7e7!important}.w3-border-pale-green,.w3-hover-border-pale-green:hover{border-color:#e7ffe7!important}
        .w3-border-pale-yellow,.w3-hover-border-pale-yellow:hover{border-color:#ffffcc!important}.w3-border-pale-blue,.w3-hover-border-pale-blue:hover{border-color:#e7ffff!important}

        .navbar{
            display: flex;
            background-color: #F6F4FC;
            align-items: center;
            padding: 5px 5px 0px;
        }

        nav{
            flex: 1;
            text-align: left;
        }

        nav ul{
            float: right;
            display: inline-block;
            list-style-type: none;
            margin-left: 450px;
        }

        nav ul li{
            display: inline-block;
            margin-right: 50px;
        }

        a{
            text-decoration: none;
            font-size: 16px;
            color:#3369FF;
        }


        .dropbtn
        {
            padding: 5px;
            color:#3369FF;
            border: none;
            margin-right: 50px;
            background: transparent
        }

        .dropdown
        {
            position: relative;
            display: inline-block;
        }

        /* Dropdown Content (Hidden by Default) */
        .dropdown-content {
            display: none;
            position: absolute;
            background-color: #f1f1f1;
            min-width: 160px;
            box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
            z-index: 1;
        }

        /* Links inside the dropdown */
        .dropdown-content a {
            color: #3369FF;
            padding: 12px 16px;
            text-decoration: none;
            display: block;
        }

        /* Change color of dropdown links on hover */
        .dropdown-content a:hover
        {background-color: #ddd;}

        /* Show the dropdown menu on hover */
        .dropdown:hover .dropdown-content {display: block;}


        .notification:hover {
            background: red;
        }

        .notification .badge {
            position: absolute;
            top: -10px;
            right: -10px;
            padding: 5px 10px;
            border-radius: 50%;
            background: red;
            color: white;
        }

        /* Three columns side by side */
        .column {
            float: left;
            width: 32%;
            margin-bottom: 16px;
            padding: 0 8px;
        }

        /* Display the columns below each other instead of side by side on small screens */
        @media screen and (max-width: 650px) {
            .column {
                width: 600px;
                display: block;
            }
        }

        /* Add some shadows to create a card effect */
        .card {
            box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
            text-align: center;
        }

        /* Some left and right padding inside the container */
        .container {
            padding: 0 16px;
        }

        /* Some left and right padding inside the container */
        .container-product
        {
            padding: 0px 16px 10px ;

        }

        /* Clear floats */
        .container::after, .row::after {
            content: "";
            clear: both;
            display: table;
        }

        .title {
            color: grey;
        }

        .button {
            border: none;
            outline: 0;
            display: inline-block;
            padding: 8px;
            color: white;
            background-color: #000;
            text-align: center;
            cursor: pointer;
            width: 100%;
        }

        .button:hover {
            background-color: #555;
        }

        .site-footer
        {
            background-color:#26272b;
            padding:45px 0 20px;
            font-size:15px;
            line-height:24px;
            color:#737373;
            text-align:center
        }

        .site-footer hr
        {
            border-top-color:#bbb;
            opacity:0.5
        }
        .site-footer hr.small
        {
            margin:20px 0
        }
        .site-footer h6
        {
            color:#fff;
            font-size:16px;
            text-transform:uppercase;
            margin-top:5px;
            letter-spacing:2px
        }
        .site-footer a
        {
            color:#737373;
        }
        .site-footer a:hover
        {
            color:#3366cc;
            text-decoration:none;
        }
        .footer-links
        {
            padding-left:0;
            list-style:none
        }
        .footer-links li
        {
            display: block
        }
        .col
        {
            display: block;
            float: left;
            width: 32%;
        }
        .footer-links a
        {
            color:#737373
        }
        .footer-links a:active,.footer-links a:focus,.footer-links a:hover
        {
            color:#3366cc;
            text-decoration:none;
        }
        .footer-links.inline li
        {
            display:inline-block
        }
        .site-footer .social-icons
        {
            text-align:right
        }
        .site-footer .social-icons a
        {
            width:40px;
            height:40px;
            line-height:40px;
            margin-left:6px;
            margin-right:0;
            border-radius:100%;
            background-color:#33353d
        }
        .copyright-text
        {
            margin:0
        }
        @media (max-width:991px)
        {
            .site-footer [class^=col-]
            {
                margin-bottom:30px
            }
        }
        @media (max-width:767px)
        {
            .site-footer
            {
                padding-bottom:0
            }
            .site-footer .copyright-text,.site-footer .social-icons
            {
                text-align:center
            }
        }

        .social-icons li
        {
            display:inline-block;
            margin-bottom:4px
        }
        .social-icons li.title
        {
            margin-right:15px;
            text-transform:uppercase;
            color:#96a2b2;
            font-weight:700;
            font-size:13px
        }
        .social-icons a{
            background-color:#eceeef;
            color:#818a91;
            font-size:16px;
            display:inline-block;
            line-height:44px;
            width:44px;
            height:44px;
            text-align:center;
            margin-right:8px;
            border-radius:100%;
            -webkit-transition:all .2s linear;
            -o-transition:all .2s linear;
            transition:all .2s linear
        }
        .social-icons a:active,.social-icons a:focus,.social-icons a:hover
        {
            color:#fff;
            background-color:#29aafe
        }
        .social-icons.size-sm a
        {
            line-height:34px;
            height:34px;
            width:34px;
            font-size:14px
        }
        .social-icons a.facebook:hover
        {
            background-color:#3b5998
        }
        .social-icons a.twitter:hover
        {
            background-color:#00aced
        }
        .social-icons a.linkedin:hover
        {
            background-color:#007bb6
        }
        .social-icons a.dribbble:hover
        {
            background-color:#ea4c89
        }
        @media (max-width:767px)
        {
            .social-icons li.title
            {
                display:block;
                margin-right:0;
                font-weight:600
            }
        }

    </style>
</head>

<body style="background-color: #EDEBEB">
<! -- Menu -->
<div class="navbar" >
    <div class="logo">
        <img src="http://www.xmu.edu.my/_upload/tpl/08/9f/2207/template2207/htmlRes/xxde_022.png" style="background: #3BC1D0" width="225px" />
    </div>
    <nav>
        <ul>
            <li><a href="HomePage.jsp">Home</a></li>
            <div class="dropdown">
                <button class="dropbtn"><a href= "AllP.jsp">Marketplace</a></button>
                <div class="dropdown-content">
                    <a href="BnS.jsp" >Books & Stationery</a>
                    <a href="FnB.jsp" >Food & Beverage</a>
                    <a href="HA.jsp" >Household appliances</a>
                    <a href="CNA.jsp" >Clothes & Accessories</a>
                    <a href="O.jsp" >Others</a>
                </div>
            </div>
            <li><a href="FAQQ.jsp">FAQ</a></li>
            <li><a href="Login.jsp">Login</a></li>
            <li><a href="Registration.jsp">Sign Up</a></li>
        </ul>
    </nav>
</div>



<section>
    <img class="mySlides" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSHOUUZWZmw34XQgPjHjJQSBW57VGqQFANong&usqp=CAU"
         style="width:100%">
    <img class="mySlides" src="https://icem-xmum.com/images/xmum-building.jpg"
         style="width:100%">
    <img class="mySlides" src="https://media.thestar.com.my/Prod/79EA7641-D3D4-4F62-9794-F6B7BB02392E"
         style="width:100%">
</section>

<!-- Page Description -->
<section style="width:100%; height:200px; padding: 250px 20px 300px 0px; margin:0px; background:#FFFBF6;">
    <h2 class="w3-justify w3-center" style="font-size:40px; font-weight: 690;"><i>X-Trade</i></h2>
    <p class="w3-justify w3-center" style="font-size: 35px; font-weight: 590;"><i>XIAMEN University Online Trading Platform</i></p>
    <p class="w3-justify w3-center" style="font-size: 30px; font-weight: 450;"> A Platform for Xiamen University Malaysia's Student to trade their products.</p>
</section>

<%

    Class.forName("com.mysql.jdbc.Driver");
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/user", "root","123456");
    Statement stm = conn.createStatement();
    ResultSet rs = stm.executeQuery("SELECT Distinct * FROM user.product\n" +
            "where product_category = 'Food & Beverage'\n" +
            "ORDER BY RAND()\n" +
            "LIMIT 1;");

    rs.next();
%>

<!-- Trending Products -->
<div class="row">
    <h2 class="w3-wide w3-center">Product Categories</h2>
    <div class="column">
        <div class="card">
            <img src="./ProductDisplayServlet?product_id=<%=rs.getString("product_id")%>"style="width:200px; height:200px; padding-top: 20px;"/>
            <div class="container-product">
                <h2><%=rs.getString("product_category")%></h2>
                <p  style="height:30px;" class="title"><%=rs.getString("product_name")%></p>
                <p style="height:100px;";><%=rs.getString("product_description")%>.</p>
                <p>Price : <%=rs.getString("price")%></p>
                <a href="Bdetail.jsp?pid=<%=rs.getString("product_id")%>">
                    <p><button class="button">Buy Now</button></p>
                </a>
            </div>
        </div>
    </div>

    <%

        Class.forName("com.mysql.jdbc.Driver");
        Connection Conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/user", "root","123456");
        Statement STm = Conn.createStatement();
        ResultSet RS = STm.executeQuery("SELECT Distinct * FROM user.product\n" +
                "where product_category = 'Household Appliance' or product_category ='Others'\n" +
                "ORDER BY RAND()\n" +
                "LIMIT 1;");

        RS.next();
    %>

    <div class="column">
        <div class="card">
            <img src="./ProductDisplayServlet?product_id=<%=RS.getString("product_id")%>"style="width:200px; height:200px; padding-top: 20px;"/>
            <div class="container-product">
                <h2><%=RS.getString("product_category")%></h2>
                <p style="height:30px;" class="title"><%=RS.getString("product_name")%></p>
                <p style="height:100px;"><%=RS.getString("product_description")%>.</p>
                <p>Price : <%=RS.getString("price")%></p>
                <a href="Bdetail.jsp?pid=<%=RS.getString("product_id")%>">
                    <p><button class="button">Buy Now</button></p>
                </a>
            </div>
        </div>
    </div>

    <%

        Class.forName("com.mysql.jdbc.Driver");
        Connection connection1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/user", "root","123456");
        Statement STM = connection1.createStatement();
        ResultSet RES = STM.executeQuery(" SELECT Distinct * FROM user.product\n" +
                "  where product_category = 'Clothes & Accessories' or product_category ='Books & Stationery'\n" +
                "  ORDER BY RAND()\n" +
                "  LIMIT 1;");

        RES.next();
    %>

    <div class="column">
        <div class="card">
            <img src="./ProductDisplayServlet?product_id=<%=RES.getString("product_id")%>"style="width:200px; height:200px; padding-top: 20px;"/>
            <div class="container-product">
                <h2><%=RES.getString("product_category")%></h2>
                <p  style="height:30px;" class="title"><%=RES.getString("product_name")%></p>
                <p style="height:100px;"><%=RES.getString("product_description")%>.</p>
                <p>Price : <%=RES.getString("price")%></p>
                <a href="Bdetail.jsp?pid=<%=RES.getString("product_id")%>">
                    <p><button class="button">Buy Now</button></p>
                </a>
            </div>
        </div>
    </div>

</div>

<!-- footer -->
<footer class="site-footer" >
    <div class="container">
        <div class="row" style="padding-left: 3%;">
            <div class="col">
                <h6 style="font-size: 20px;">About</h6>
                <p1 class="text-justify">X-Trade is the perfect place for you to have fun.</p1><br><br><br>
                <p1 class="copyright-text" style="padding-right: 12px;">Copyright &copy; 2021 All Rights Reserved by
                    <a href="HomePage.jsp">X-Trade</a>.
                </p1>
            </div>



            <div class="col" style="padding-left: 2%;">
                <h6 style="font-size: 20px;">Categories</h6>
                <ul class="footer-links">
                    <li style="padding-top: 4px; padding-bottom: 4px;"><a href="BnS.jsp">Books & Stationery</a></li>
                    <li style="padding-top: 4px; padding-bottom: 4px;"><a href="FnB.jsp" >Food & Beverage</a></li>
                    <li style="padding-top: 4px; padding-bottom: 4px;"><a href="HA.jsp" >Household appliances</a></li>
                    <li style="padding-top: 4px; padding-bottom: 4px;"><a href="CNA.jsp" >Clothes & Accessories</a></li>
                    <li style="padding-top: 4px; padding-bottom: 4px;"><a href="O.jsp" >Others</a></li>
                </ul>
            </div>

            <div class="col">
                <h6 style="font-size: 20px;">Quick Links</h6>
                <ul class="footer-links">
                    <li style="padding-top: 4px; padding-bottom: 4px;"><a href="HomePage.jsp">Home</a></li>
                    <li style="padding-top: 4px; padding-bottom: 4px;"><a href="AllP.jsp">Marketplace</a></li>
                    <li style="padding-top: 4px; padding-bottom: 4px;"><a href="FAQQ.jsp">Frequent Ask Questions</a></li>
                </ul>
            </div>
        </div>
    </div>
</footer>

</body>

<script>
    // Automatic Slideshow - change image every 3 seconds
    var myIndex = 0;
    carousel();

    function carousel() {
        var i;
        var x = document.getElementsByClassName("mySlides");
        for (i = 0; i < x.length; i++) {
            x[i].style.display = "none";
        }
        myIndex++;
        if (myIndex > x.length) {myIndex = 1}
        x[myIndex-1].style.display = "block";
        setTimeout(carousel, 3000);
    }
</script>


</body>
</html>