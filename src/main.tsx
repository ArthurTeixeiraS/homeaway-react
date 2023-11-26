import React from 'react'
import ReactDOM from 'react-dom/client'
import { App } from './App.tsx'
export const BaseURL = 'http://localhost:8080/api'

ReactDOM.createRoot(document.getElementById('root')!).render(
  <React.StrictMode>
    <App />
  </React.StrictMode>,
)
