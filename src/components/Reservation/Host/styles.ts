import { styled } from 'styled-components'

export const Container = styled.div`
  padding: 5%;
  display: flex;
  flex-direction: column;
  .title {
    h1 {
      display: flex;
      align-items: center;
      font-size: 3rem;
      a {
        color: black;
      }
      #backArrow {
        margin-right: 1rem;
      }
      span {
        font-size: 1.5rem;
        margin-left: 2rem;
        margin-top: 0.8rem;
      }
    }
    p {
      font-size: 1.3rem;
    }
  }
  .reservationsContainer {
    .buttons {
      margin-bottom: 2rem;
      margin-left: 1rem;
      button {
        margin-right: 2rem;
        padding: 1rem 3rem;
        font-size: 1.3rem;
        color: white;
        background-color: ${(props) => props.theme['yellow-secondary']};
        border: 0;
        border-radius: 1.5rem;
        transition: all 0.2s ease-in-out;
        &:hover {
          filter: brightness(90%);
        }
      }
      #removebtn {
        background-color: ${(props) => props.theme['background-gray']};
        color: ${(props) => props.theme.black};
      }
    }
    margin-top: 5rem;
  }
`
