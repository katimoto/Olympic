if (location.pathname.match("articles/new")){
  window.addEventListener("load", (e) => {
  const inputElement = document.getElementById("articles_tag_word");
  console.log(inputElement);
    inputElement.addEventListener("keyup", (e) => {
      const input = document.getElementById("articles_tag_word").value;
      const xhr = new XMLHttpRequest();
      xhr.open("GET", `tagsearch/?input=${input}`, true);
      xhr.responseType = "json";
      xhr.send();
      xhr.onload = () => {
        const tagName = xhr.response.keyword;
        const searchResult = document.getElementById('search-result')
        searchResult.innerHTML = ''
        tagName.forEach(function(tag){

          const parentsElement = document.createElement('div')
          const childElement = document.createElement('div')

          parentsElement.setAttribute('id', 'parents')
          childElement.setAttribute('id', tag.id )
          childElement.setAttribute('class', 'child' )

          parentsElement.appendChild(childElement)
          childElement.innerHTML = tag.word
          searchResult.appendChild(parentsElement)

          const clickElement = document.getElementById(tag.id)
          clickElement.addEventListener("click", () => {
            document.getElementById("articles_tag_word").value = clickElement.textContent;
            clickElement.remove();
          })
        })
      }
    });
  })
};