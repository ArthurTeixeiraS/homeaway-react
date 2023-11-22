import styled from 'styled-components'
import banner from '../../../assets/backgrounds/banner-blur.png'

export const BackGroundImage = styled.div`
  width: 100%;
  height: auto;
  background-image: url(${banner});
  background-repeat: no-repeat;
  background-size: cover;
  display: flex;
  justify-content: center;
`

export const Container = styled.div`
  padding: 5%;
  display: flex;
  justify-content: center;
  align-items: center;
  padding: 5rem 8rem;
  form {
    background-color: white;
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
            cursor: pointer;
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
      display: flex;
      flex-direction: column;
      margin-top: 1rem;
      label {
        font-weight: bold;
        font-size: 1.5rem;
        padding: 0.5rem 0 1rem 0.5rem;
      }
      input[type='text'] {
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
      .maxpeople {
        display: flex;
        flex-direction: row;
        justify-content: flex-start;
        input[type='number'] {
          width: 50%;
          outline: none;
          height: 4rem;
          border-radius: 2rem;
          border: 1px solid #c2c6cc;
          padding: 0.5rem;
          font-size: 1.3rem;
          font-weight: bold;
          margin-bottom: 0.5rem;
          margin-right: 1rem;
        }
        p {
          font-size: 1.3rem;
        }
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
      justify-content: space-evenly;
      align-items: center;
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
        &:hover {
          filter: brightness(97%);
          cursor: pointer;
        }
      }
      button[type='button'] {
        width: 100%;
        margin: 3rem 0 0 0;
        align-items: center;
        margin-right: 2rem;
        margin-right: 1.5rem;
        font-size: 1.5rem;
        font-weight: bold;
        color: ${(props) => props.theme.black};
        background-color: transparent;
        border: 0;
        border-radius: 1rem;
        &:hover {
          filter: brightness(97%);
          cursor: pointer;
        }
      }
    }
  }
`
