const express = require('express')
const { getAllAuthors, getAuthorByIdWithNovelsAndNovelGenres } = require('./controllers/authors.js')
const { getAllGenres, getGenreByIdWithNovelsAndNovelAuthors } = require('./controllers/genres.js')
const { getAllNovelsWithAuthorsAndGenres, getNovelByIdWithAuthorsAndGenres } = require('./controllers/novels.js')

const app = express()

app.get('/authors', getAllAuthors)

app.get('/authors/:id', getAuthorByIdWithNovelsAndNovelGenres)

app.get('/genres', getAllGenres)

app.get('/genres/:id', getGenreByIdWithNovelsAndNovelAuthors)

app.get('/novels', getAllNovelsWithAuthorsAndGenres)

app.get('/novels/:id', getNovelByIdWithAuthorsAndGenres)

app.get('*', (req, res) => {
  return res.status(404).send('Page not found. Try /authors or /novels or /genres to get started.')
})

app.listen(1337, () => {
  console.log('Listening on port 1337...') // eslint-disable-line no-console
})
