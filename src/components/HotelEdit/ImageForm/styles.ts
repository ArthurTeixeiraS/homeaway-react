import { styled } from 'styled-components'
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
  display: flex;
  justify-content: center;
  height: 100vh;
  padding: 8%;
  form {
    background-color: white;
    border: 1px solid ${(props) => props.theme['yellow-secondary']};
    border-radius: 1.5rem;
    padding: 2.5rem;
    .image {
      display: flex;
      align-items: center;
      justify-content: center;
      flex-direction: column;
      padding: 2.5rem;
      input[type='file'] {
        display: none;
      }
    }
    h1 {
      text-align: center;
      border-bottom: 1px solid ${(props) => props.theme['border-gray']};
      padding-bottom: 1rem;
      width: 40rem;
    }
    .labelImage {
      background: ${(props) => props.theme['yellow-secondary']};
      color: ${(props) => props.theme.white};
      border-radius: 1rem;
      transition: all 0.3s ease-in-out;
      text-align: center;
      display: flex;
      align-items: center;
      width: 20rem;
      height: 5rem;
      p {
        padding: 0.6rem;
        font-size: 1.5rem;
        font-weight: bold;
        text-align: center;
        justify-content: center;
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
    .submit {
      display: flex;
      flex-direction: row;
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
