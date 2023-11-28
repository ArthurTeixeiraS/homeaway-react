import { styled } from 'styled-components'

export const Container = styled.div`
  padding: 5%;
  display: flex;
  flex-direction: column;
`

export const TitleContainer = styled.div`
  display: flex;
  justify-content: space-between;
  margin-bottom: 5rem;
  align-items: center;
  .buttons {
    .reserv {
      margin-right: 2rem;
    }
  }
  a {
    text-decoration: none;
    button {
      background-color: ${(props) => props.theme['yellow-secondary']};
      color: white;
      padding: 1rem 3rem;
      font-weight: bold;
      font-size: 1.3rem;
      border-radius: 1.5rem;
      border: 0;
      transition: all 0.2s ease-in-out;
      &:hover {
        filter: brightness(90%);
      }
    }
  }
  h1 {
    text-align: start;
    font-size: 2.5rem;
    display: flex;
    align-items: center;
    justify-content: space-between;
    margin-right: 30rem;
    .arrow {
      margin-right: 1rem;
      a {
        color: black;
      }
    }
  }
`
