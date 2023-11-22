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
          border: 1px solid ${(props) => props.theme['blue-primary']};
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
          border: 1px solid ${(props) => props.theme['blue-primary']};
          padding: 1rem;
          font-size: 1.5rem;
          /*          color: ${(props) => props.theme.black}; */
          font-weight: bold;
        }
        #cpf {
          &:hover {
            cursor: not-allowed;
          }
        }
        .buttons {
          padding: 2rem 0 2rem 2rem;
          display: flex;
          justify-content: flex-end;
          button {
            margin: 0.5rem;
          }
          a {
            text-decoration: none;
            display: flex;
            justify-content: center;
            align-items: center;
            .cancel {
              background-color: transparent;
              border: 0;
              font-size: 1.4rem;
              &:hover {
                cursor: pointer;
              }
              img {
                width: 1.4rem;
                margin-right: 1rem;
                &:hover {
                  cursor: pointer;
                }
              }
            }
          }
          .remove {
            background-color: transparent;
            border: 1px solid red;
            padding: 1rem;
            border-radius: 1rem;
            font-size: 1.4rem;
            display: flex;
            justify-content: center;
            align-items: center;
            color: red;
            transition: all 0.2s ease-in-out;
            &:hover {
              cursor: pointer;
              color: white;
              background-color: red;
            }
          }
          .save {
            background-color: transparent;
            border: 1px solid ${(props) => props.theme['blue-primary']};
            padding: 1rem;
            border-radius: 1rem;
            font-size: 1.4rem;
            display: flex;
            justify-content: center;
            align-items: center;
            color: ${(props) => props.theme['blue-primary']};
            transition: all 0.2s ease-in-out;
            &:hover {
              cursor: pointer;
              color: white;
              background-color: ${(props) => props.theme['blue-primary']};
            }
          }
        }
        label {
          padding: 1rem;
          font-size: 1.2rem;
        }
      }
    }
  }
`
