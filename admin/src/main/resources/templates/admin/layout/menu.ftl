<#import "/spring.ftl" as spring/>
<!-- BEGIN SIDEBAR MENU -->
<!-- DOC: Apply "page-sidebar-menu-light" class right after "page-sidebar-menu" to enable light sidebar menu style(without borders) -->

<!-- DOC: Apply "page-sidebar-menu-hover-submenu" class right after "page-sidebar-menu" to enable hoverable(hover vs accordion) sub menu mode -->
<!-- DOC: Apply "page-sidebar-menu-closed" class right after "page-sidebar-menu" to collapse("page-sidebar-closed" class must be applied to the body element) the sidebar sub menu mode -->
<!-- DOC: Set data-auto-scroll="false" to disable the sidebar from auto scrolling/focusing -->
<!-- DOC: Set data-keep-expand="true" to keep the submenues expanded -->
<!-- DOC: Set data-auto-speed="200" to adjust the sub menu slide up/down speed -->
<ul class="page-sidebar-menu  page-header-fixed page-sidebar-menu-hover-submenu " data-keep-expanded="false"
    data-auto-scroll="true" data-slide-speed="200">
    <li class="nav-item active">
        <a href="javascript:;" class="nav-link nav-toggle">
            <i class="icon-folder"></i>
            <span class="title">Section 1</span>
            <span class="arrow open"></span>
        </a>
        <ul class="sub-menu">
            <li class="nav-item active">
                <a href="javascript:;" class="nav-link nav-toggle">
                    <i class="icon-settings"></i> Child Section
                    <span class="arrow open"></span>
                </a>
                <ul class="sub-menu">
                    <li class="nav-item">
                        <a href="admin/user/list.html" class="ajaxify nav-link">
                            <i class="icon-camera"></i>用户列表</a>
                    </li>
                    <li class="nav-item">
                        <a href="admin/layout_ajax_page_content_2.html" class="ajaxify nav-link">
                            <i class="icon-link"></i> Sample Link 2</a>
                    </li>
                    <li class="nav-item">
                        <a href="admin/layout_ajax_page_content_3.html" class="ajaxify nav-link">
                            <i class="icon-pointer"></i> Sample Link 3</a>
                    </li>
                    <li class="nav-item">
                        <a href="admin/layout_ajax_page_content_4.html" class="ajaxify nav-link">
                            <i class="icon-camera"></i> Sample Link 4</a>
                    </li>
                    <li class="nav-item">
                        <a href="admin/layout_ajax_page_content_5.html" class="ajaxify nav-link">
                            <i class="icon-link"></i> Sample Link 5</a>
                    </li>
                    <li class="nav-item">
                        <a href="admin/layout_ajax_page_content_1.html" class="ajaxify nav-link">
                            <i class="icon-pointer"></i> Sample Link 6</a>
                    </li>
                </ul>
            </li>
            <li class="nav-item open">
                <a href="javascript:;" target="_blank" class="nav-link">
                    <i class="icon-globe"></i> Arrow Toggle
                    <span class="arrow nav-toggle"></span>
                </a>
                <ul class="sub-menu">
                    <li class="nav-item">
                        <a href="admin/layout_ajax_page_content_2.html" class="ajaxify nav-link">
                            <i class="icon-camera"></i> Sample Link 1</a>
                    </li>
                    <li class="nav-item">
                        <a href="admin/layout_ajax_page_content_3.html" class="ajaxify nav-link">
                            <i class="icon-link"></i> Sample Link 2</a>
                    </li>
                    <li class="nav-item">
                        <a href="admin/layout_ajax_page_content_4.html" class="ajaxify nav-link">
                            <i class="icon-pointer"></i> Sample Link 3</a>
                    </li>
                    <li class="nav-item">
                        <a href="admin/layout_ajax_page_content_5.html" class="ajaxify nav-link">
                            <i class="icon-camera"></i> Sample Link 4</a>
                    </li>
                    <li class="nav-item">
                        <a href="admin/layout_ajax_page_content_1.html" class="ajaxify nav-link">
                            <i class="icon-link"></i> Sample Link 5</a>
                    </li>
                    <li class="nav-item">
                        <a href="admin/layout_ajax_page_content_2.html" class="ajaxify nav-link">
                            <i class="icon-pointer"></i> Sample Link 6</a>
                    </li>
                </ul>
            </li>
        </ul>
    </li>
    <li class="nav-item">
        <a href="sys/user/list.html" class="ajaxify nav-link">
            <i class="icon-bar-chart"></i>
            <span class="title">用户列表</span>
        </a>
    </li>
    <li class="nav-item">
        <a href="sys/resource/menu_list.html" class="ajaxify nav-link">
            <i class="icon-user"></i>
            <span class="title">权限管理</span>
        </a>
    </li>
    <li class="nav-item">
        <a href="sys/dict/list.html" class="ajaxify nav-link">
            <i class="icon-user"></i>
            <span class="title">字典管理</span>
        </a>
    </li>
    <li class="nav-item">
        <a href="javascript:;" class="nav-link nav-toggle">
            <i class="icon-folder"></i>
            <span class="title">Section 4</span>
            <span class="arrow"></span>
        </a>
        <ul class="sub-menu">
            <li class="nav-item">
                <a href="admin/layout_ajax_page_content_5.html" class="ajaxify nav-link">
                    <i class="icon-camera"></i> Sample Link 1</a>
            </li>
            <li class="nav-item">
                <a href="admin/layout_ajax_page_content_1.html" class="ajaxify nav-link">
                    <i class="icon-link"></i> Sample Link 2</a>
            </li>
            <li class="nav-item">
                <a href="admin/layout_ajax_page_content_2.html" class="ajaxify nav-link">
                    <i class="icon-pointer"></i> Sample Link 3</a>
            </li>
            <li class="nav-item">
                <a href="admin/layout_ajax_page_content_3.html" class="ajaxify nav-link">
                    <i class="icon-camera"></i> Sample Link 4</a>
            </li>
            <li class="nav-item">
                <a href="admin/layout_ajax_page_content_4.html" class="ajaxify nav-link">
                    <i class="icon-link"></i> Sample Link 5</a>
            </li>
            <li class="nav-item">
                <a href="admin/layout_ajax_page_content_5.html" class="ajaxify nav-link">
                    <i class="icon-pointer"></i> Sample Link 6</a>
            </li>
        </ul>
    </li>
</ul>
<!-- END SIDEBAR MENU -->

