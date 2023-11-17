import styled from 'styled-components'

export const Container = styled.div`
  display: flex;
  justify-content: center;
  align-items: center;
  padding: 5rem 8rem;
  form {
    border: 1px solid ${(props) => props.theme['yellow-secondary']};
    border-radius: 1.5rem;
    padding: 2.5rem;
    h1 {
      text-align: center;
      border-bottom: 1px solid ${(props) => props.theme['border-gray']};
      padding-bottom: 1rem;
      width: 40rem;
    }
    .inputs {
      display: grid;
      grid-template-columns: 300px 100px;
      grid-row: auto auto;
      grid-column-gap: 20px;
      .image {
        display: flex;
        align-items: center;
        justify-content: center;
        flex-direction: column;
        padding: 2.5rem;
        input[type='file'] {
          display: none;
        }
        .labelImage {
          background: ${(props) => props.theme['yellow-secondary']};
          color: ${(props) => props.theme.white};
          border-radius: 1rem;
          transition: all 0.3s ease-in-out;
          p {
            padding: 0.6rem;
          }
          &:hover {
            transform: scale(1.1);
          }
        }
        div {
          display: flex;
          flex-direction: column;
          align-items: center;
          justify-content: center;
          h2 {
            padding: 0.5rem;
          }
          img {
            width: 300px;
            height: 200px;
          }
        }
      }
      .streetNumber,
      .cityUF {
        display: grid;
        grid-template-columns: 300px 100px;
        grid-row: auto auto;
        grid-column-gap: 20px;
      }
      display: flex;
      flex-direction: column;
      margin-top: 1rem;
      label {
        font-weight: bold;
        font-size: 1.5rem;
        padding: 0.5rem 0 1rem 0.5rem;
      }
      input[type='text'],
      select {
        width: 100%;
        outline: none;
        height: 4rem;
        border-radius: 2rem;
        border: 1px solid #c2c6cc;
        padding: 0.5rem;
        font-size: 1.3rem;
        font-weight: bold;
        margin-bottom: 0.5rem;
      }
      textarea {
        width: 100%;
        outline: none;
        border-radius: 2rem;
        border: 1px solid #c2c6cc;
        padding: 0.5rem;
        font-size: 1.3rem;
        font-weight: bold;
        margin-bottom: 0.5rem;
        resize: none;
      }
      h2 {
        text-align: center;
        padding: 1.5rem 0.5rem;
        font-size: 1.8rem;
      }
      .cityUF {
        margin-bottom: 2rem;
      }
      .filters {
        margin: 0 auto;
        width: 85%;
        padding: 1rem;
        border: 1px solid ${(props) => props.theme['border-gray']};
        border-radius: 1rem;
        display: flex;
        align-items: center;
        justify-content: center;
        text-align: center;
        flex-direction: column;
        div {
          display: flex;
          align-items: center;
          justify-content: center;
        }
        input[type='checkbox'] {
          appearance: none;
          -webkit-appearance: none;
          -moz-appearance: none;
          width: 20px;
          height: 20px;
          border: 2px solid #ffc107;
          background-color: white;
          border-radius: 4px;
          cursor: pointer;
          margin: 0 0 0.5rem 1rem;
        }
        input[type='checkbox']:checked {
          background-color: #ffc107;
        }
      }
    }
    .submit {
      display: flex;
      justify-content: center;
      button[type='submit'] {
        width: 40%;
        margin: 3rem 0 0 0;
        align-items: center;
        padding: 1.5rem;
        font-size: 1.5rem;
        font-weight: bold;
        color: white;
        background-color: ${(props) => props.theme['yellow-secondary']};
        border: 0;
        border-radius: 1rem;
      }
      &:hover {
        filter: brightness(97%);
      }
    }
  }
`
