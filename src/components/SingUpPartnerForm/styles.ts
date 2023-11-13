import styled from 'styled-components'
import banner from '../../assets/backgrounds/banner-blur.png'

export const SingupContainer = styled.div`
  background-color: ${(props) => props.theme.white};
  width: 40%;
  height: 80%;
  z-index: 5;
  border-radius: 2.8rem;
  border: 2px solid ${(props) => props.theme['yellow-secondary']};
  padding: 3rem;
  margin-top: 3.5rem;
  @media screen and (min-width: 1365px) {
    height: 75%;
  }
  .titleContainer {
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    padding-bottom: 1rem;
    border-bottom: 1px solid ${(props) => props.theme['border-gray']};
    h2 {
      font-size: 2.5rem;
      span {
        color: ${(props) => props.theme['yellow-secondary']};
      }
    }
    p {
      font-size: 1.2rem;
    }
  }
  .loginInput {
    display: block;
    margin-top: 2rem;
    margin-bottom: 0.8rem;
    form {
      display: block;
      align-items: start;
      justify-content: center;

      select {
        width: 11.5rem;
        border-radius: 2rem 0 0 2rem;
        outline: none;
        height: 5rem;
        border: 1px solid #c2c6cc;
        padding: 1rem;
        font-size: 1.5rem;
        font-weight: bold;
      }
      input[type='email'] {
        width: 100%;
        outline: none;
        height: 5rem;
        border-radius: 2rem;
        border: 1px solid #c2c6cc;
        padding: 1rem;
        font-size: 1.5rem;
        font-weight: bold;
      }
      .caption {
        display: block;
        margin: 0.5rem 0 1rem 0.5rem;
      }
      .error {
        color: red;
        font-size: 1.3rem;
      }
      .buttons {
        padding: 2rem 0 5rem 0;
        display: flex;
        justify-content: center;
        align-items: center;
        .continue {
          margin-right: 1rem;
          width: 20%;
          height: 4.5rem;
          border-radius: 2rem;
          border: 0;
          background: ${(props) => props.theme['yellow-secondary']};
          color: white;
          font-size: 1.3rem;
        }
        .switchButton {
          margin-right: 1rem;
          width: 30%;
          height: 4.5rem;
          border-radius: 2rem;
          border: 0;
          background: ${(props) => props.theme['blue-primary']};
          color: white;
          font-size: 1.3rem;
          a {
            text-decoration: none;
            color: ${(props) => props.theme.white};
          }
        }
      }
    }
  }
  input[type='password'],
  input[type='text'] {
    width: 100%;
    outline: none;
    height: 5rem;
    border-radius: 2rem;
    border: 1px solid #c2c6cc;
    padding: 1rem;
    font-size: 1.5rem;
    font-weight: bold;
  }
  .form-title-container {
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    margin-bottom: 2rem;
    .form-title {
      font-size: 2rem;
      span {
        color: ${(props) => props.theme['yellow-secondary']};
      }
    }
    a {
      font-size: 1.2rem;
      text-decoration: none;
    }
  }
`

export const BackGroundImage = styled.div`
  width: 100%;
  height: 100vh;
  background-image: url(${banner});
  background-repeat: no-repeat;
  background-size: cover;
  display: flex;
  justify-content: center;
`
