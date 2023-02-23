<#macro pager url page filter="" variables=[] mapVariables=[]>
    <#if page.getTotalPages() gt 7>
        <#assign
        totalPages = page.getTotalPages()
        pageNumber = page.getNumber() + 1

        head = (pageNumber > 4)?then([1, -1], [1, 2, 3])
        tail = (pageNumber < totalPages - 3)?then([-1, totalPages], [totalPages - 2, totalPages - 1, totalPages])
        bodyBefore = (pageNumber > 4 && pageNumber < totalPages - 1)?then([pageNumber - 2, pageNumber - 1], [])
        bodyAfter = (pageNumber > 2 && pageNumber < totalPages - 3)?then([pageNumber + 1, pageNumber + 2], [])

        body = head + bodyBefore + (pageNumber > 3 && pageNumber < totalPages - 2)?then([pageNumber], []) + bodyAfter + tail
        >
    <#else>
        <#assign body = 1..page.getTotalPages()>
    </#if>

    <#if variables?? && variables?size gt 0>
        <#assign params = "">
        <#list variables as variable>
            <#assign params = params + "&" + variable.name + "=" + variable.value>
        </#list>
    </#if>
    <#if mapVariables?? && mapVariables?size gt 0>
        <#assign params = "">
        <#list mapVariables as k, v>
            <#assign params = params + "&" + k + "=" + v>
        </#list>
    </#if>

    <div class="mt-2 d-flex justify-content-between">
        <ul class="pagination ">
            <li class="page-item disabled">
                <a class="page-link" href="#" tabindex="-1">Количество элементов</a>
            </li>
            <#list [10, 20, 50] as c>
                <#if c == page.getSize()>
                    <li class="page-item active">
                        <a class="page-link" href="#" tabindex="-1">${c}</a>
                    </li>
                <#else>
                    <li class="page-item">
                        <a class="page-link" href="${url}?filter=${filter}&page=${0}&size=${c}${(params??)?string('${params!"#"}','')}" tabindex="-1">${c}</a>
                    </li>
                </#if>
            </#list>
        </ul>

        <ul class="pagination justify-content-center">
            <#list body as p>
                <#if (p - 1) == page.getNumber()>
                    <li class="page-item active">
                        <a class="page-link bg-secondary" href="#" tabindex="-1">${p?c}</a>
                    </li>
                <#elseif p == -1>
                    <li class="page-item disabled">
                        <a class="page-link" href="#" tabindex="-1">...</a>
                    </li>
                <#else>
                    <li class="page-item">
                        <a class="page-link" href="${url}?filter=${filter}&page=${(p - 1)?c}&size=${page.getSize()}${(params??)?string('${params!"#"}','')}" tabindex="-1">${p}</a>
                    </li>
                </#if>
            </#list>
        </ul>

        <ul class="pagination justify-content-end">
            <#if page.getNumber() == 0>
                <li class="page-item disabled">
                    <a class="page-link" href="#" tabindex="-1">
                        <span aria-hidden="true">&laquo;</span>
                        <span class="sr-only">Previous</span>
                    </a>
                </li>
            <#else>
                <li class="page-item">
                    <a class="page-link" href="${url}?filter=${filter}&page=${(page.getNumber() - 1)?c}&size=${page.getSize()}${(params??)?string('${params!"#"}','')}" tabindex="-1">
                        <span aria-hidden="true">&laquo;</span>
                        <span class="sr-only">Previous</span>
                    </a>
                </li>
            </#if>

            <#if page.getNumber() == page.getTotalPages() - 1>
                <li class="page-item disabled">
                    <a class="page-link" href="" tabindex="-1">
                        <span aria-hidden="true">&raquo;</span>
                        <span class="sr-only">Next</span>
                    </a>
                </li>
            <#else>
                <li class="page-item">
                    <a class="page-link" href="${url}?filter=${filter}&page=${(page.getNumber() + 1)?c}&size=${page.getSize()}${(params??)?string('${params!"#"}','')}" tabindex="-1">
                        <span aria-hidden="true">&raquo;</span>
                        <span class="sr-only">Next</span>
                    </a>
                </li>
            </#if>
        </ul>
    </div>
</#macro>