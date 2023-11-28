import React from 'react'
import ReactDOM from 'react-dom/client'
import { App } from './App.tsx'
export const BaseURL = 'https://02b9-177-200-4-83.ngrok-free.app/api'

ReactDOM.createRoot(document.getElementById('root')!).render(
  <React.StrictMode>
    <App />
  </React.StrictMode>,
)
