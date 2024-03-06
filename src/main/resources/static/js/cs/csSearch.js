const select = document.querySelector(".searchType");
const options = select.querySelectorAll("option");
const searchButton = document.querySelector(".searchButton");
const searchInput = document.querySelector(".searchInput");
const noticeLists = document.querySelector(".noticeLists");

load();

function load(searchType = "", searchInputValue = "") {
    $.ajax({
        type: "get",
        url: "/api/notice/list",
        data: {
            searchType: searchType,
            searchInput: searchInputValue
        },
        success: function (data) {
            innerFun(data);
        },
        error: function () {
            alert("에러");
        }
    });
}

searchButton.onclick = () => {
    for (let i = 0; i < options.length; i++) {
        if (options[i].selected) {
            searchType = options[i].value;
        }
    }

    console.log("검색어:" + searchInput.value);

    load(searchType, searchInput.value);
};

// Initial load without search
// You can call this with specific search parameters if needed
load();

function innerFun(data) {
    let innr = "";
    for (let i = 0; i < data.length; i++) {
        const date = new Date(data[i].rdate);

        const formattedDate = date.toLocaleDateString("en-GB", {
            day: "2-digit",
            month: "2-digit",
            year: "numeric"
        }).replace(/\//g, '-');

        innr += `
            <tr class="page-click" id="${data[i].id}">
                <td><i class="bi bi-megaphone-fill text-danger">${data[i].id}</i></td>
                <td class="text-left" width="50%">
                    <div class="panel-cs-container">
                        <p class="panel-cs-title">${data[i].title}</p>
                    </div>
                </td>
                <td><i class="bi bi-file-earmark-text-fill">${data[i].filepath}</i></td>
                <td>${data[i].writer}</td>
                <td>${formattedDate}</td>
            </tr>
        `;
    }
    noticeLists.innerHTML = innr;
    const pageRows = document.querySelectorAll(".page-click");
    for (let i = 0; i < pageRows.length; i++) {
        pageRows[i].onclick = () => {
            location.href = "/notice/view/" + pageRows[i].id;
        };
    }
}
