fetchMoreUserPosts = (e, user_id) => {
  if ((window.innerHeight + window.scrollY) >= document.body.offsetHeight) {
    window.removeEventListener('scroll', fetchMoreUserPosts)
    fetch(`/user_posts/${user_id}?offset=${offset}`)
      .then(function(response) {
        return response.json()
      })
      .then(function(response) {
        appendMorePosts(response)
        offset = offset + 10
        window.addEventListener('scroll', fetchMoreUserPosts)
      })
  }
}

appendMorePosts = new_posts => {
  const posts = document.querySelector('.posts')
  new_posts.forEach(response => {
    const postDiv = document.createElement('div')
    postDiv.className = 'post'
    postDiv.innerHTML = `
      <p class="post__content">${response.content}</p>
        <div class="post__weather">
            <span class="post__weather--icon"><i class="fas fa-sun"></i></span><p class="post__weather--text">${response.weather_description}</p>
        </div>
        <div class="post__footer">
          <p class="post__footer--time">${formatDate(response.created_at)}</p>
          <p class="post__footer--city">${response.city}</p>
        </div>
      </div>
    `
    posts.appendChild(postDiv)  
  })
}