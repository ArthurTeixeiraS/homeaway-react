import styled from 'styled-components'

export const Container = styled.div`
  width: 100%;
  height: 62rem;
  display: flex;
  justify-content: center;
  align-items: center;
  img {
    width: 40rem;
    transition: all 2s ease-in-out;

    &:hover {
      transform: rotate(1060deg);
    }
  }
  h1 {
    font-size: 5rem;
    font-weight: bold;
    span {
      color: ${(props) => props.theme['yellow-secondary']};
    }
  }
  p {
    font-size: 1.8rem;
    .notExists {
      color: red;
    }
    .dev {
      color: ${(props) => props.theme['blue-primary']};
    }
  }
`
