postMemory = (content, locator, token) => {
  let fetchUrl = ``;
  if (locator.coords !== undefined) {
    let { coords } = locator
    fetchUrl += `/posts?lat=${coords.latitude}&lon=${coords.longitude}&content=${content}`
  } else {
    fetchUrl += `/post_by_ip?content=${content}&ip=${ip}`
  }
    fetch(fetchUrl,
  {
    headers: {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      "X-CSRF-Token": token,
    },
    method: "POST",
  })
  .then(res => res.json())
  .then(res => {console.log(res); appendNewPost(res)})
  .catch(function(res){ console.log(res) })
}

// postMemoryByIp = (content, ip, token) => {
//     fetch(`/post_by_ip?content=${content}&ip=${ip}`,
//   {
//     headers: {
//       'Accept': 'application/json',
//       'Content-Type': 'application/json',
//       "X-CSRF-Token": token,
//     },
//     method: "POST",
//   })
//   .then(res => res.json())
//   .then(res => {console.log(res); appendNewPost(res)})
//   .catch(function(res){ console.log(res) })
// }

appendNewPost = (response) => {
  const posts = document.querySelector('.posts')
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
  posts.insertBefore(postDiv, posts.firstChild)
}

formatDate = (dateString) => {
  date = new Date(dateString)
  string = ``
  string += Math.abs(date.getHours() - 12)
  string += `:${date.getMinutes().toString().length === 0 ? '0' + date.getMinutes() : date.getMinutes()} `
  string += `${date.getHours() < 12 ? 'am' : 'pm'} `
  string += `– ${date.toDateString().split(' ')[0]}, `
  string += `${date.toLocaleDateString()}`
  return string
}
