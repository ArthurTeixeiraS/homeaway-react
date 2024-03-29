import styled from 'styled-components'

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
      .userInfos {
        h2 {
          font-size: 2.5rem;
          display: flex;
          justify-content: space-between;
          align-items: center;
          a {
            margin-left: 1rem;
          }
        }
        p {
          padding: 1rem 0 0 0.5rem;
          font-size: 1.2rem;
        }
      }
      .divButton {
        border-bottom: 1px solid ${(props) => props.theme['border-gray']};
        padding-bottom: 1.5rem;
        a {
          text-decoration: none;
          color: #4086f4;
          font-size: 1.5rem;
          button {
            margin-top: 3rem;
            margin-left: 1rem;
            width: 158px;
            height: 54px;
            border-radius: 6px;
            border: 1px solid #4086f4;
            background: #fff;
            color: #4086f4;
            font-size: 1.5rem;
            transition: all 0.5s ease-in-out;
            &:hover {
              cursor: pointer;
              background: #4086f4;
              color: #fff;
            }
          }
        }
      }
      .exitBtn {
        border: 0;
        button {
          margin-top: 1rem;
          margin-left: 1rem;
          background-color: transparent;
          color: red;
          font-size: 1.5rem;
          border: 1px solid red;
          width: 158px;
          border-radius: 6px;
          height: 54px;
          transition: all 0.5s ease-in-out;
          &:hover {
            cursor: pointer;
            background: red;
            color: #fff;
          }
        }
      }
    }
  }
`
