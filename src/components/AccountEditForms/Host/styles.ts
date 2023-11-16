import { styled } from 'styled-components'

export const FormContainer = styled.div`
  padding: 5%;
  .infoDiv {
    display: flex;
    justify-content: flex-start;
    .staticInfo {
      width: 30rem;
      height: 50rem;
      background-color: ${(props) => props.theme['background-gray']};
      border-radius: 0.8rem;
      display: flex;
      flex-direction: column;
      align-items: center;

      img {
        width: 18rem;
        margin-top: 3rem;
      }
      .infos {
        display: flex;
        flex-direction: column;
        align-items: center;
        h2 {
          margin: 7rem 0 1rem 0;
          font-size: 2rem;
        }
        p {
          font-size: 1.6rem;
        }
      }
      .verified {
        display: flex;
        justify-content: center;
        align-items: center;
        flex-direction: column;
        margin-top: 3rem;
        .emailVerified {
          display: flex;
          align-items: center;
          justify-content: center;
        }
        img {
          width: 2rem;
          margin-top: -0.3rem;
        }
        p {
          font-size: 1.4rem;
        }
      }
    }
    .content {
      padding: 1.5rem;
      width: 60%;
      .userInfos {
        h2 {
          font-size: 2.5rem;
        }
        p {
          padding: 1rem 0 0 0.5rem;
          font-size: 1.2rem;
        }
      }
      form {
        padding: 1.5rem 0 0 0;
        input[type='text'],
        input[type='email'] {
          margin: 1rem 0 0 0;
          width: 100%;
          outline: none;
          height: 5rem;
          border-radius: 2rem;
          border: 1px solid #c2c6cc;
          padding: 1rem;
          font-size: 1.5rem;
          font-weight: bold;
        }
        input[type='date'] {
          margin: 1rem 0 0 0;
          width: 100%;
          outline: none;
          height: 5rem;
          border-radius: 2rem;
          border: 1px solid #c2c6cc;
          padding: 1rem;
          font-size: 1.5rem;
          color: ${(props) => props.theme.black};
        }
        label {
          padding: 1rem;
          font-size: 1.2rem;
        }
      }
    }
  }
`
