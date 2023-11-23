import styled from 'styled-components'

export const HotelCard = styled.div`
  transition: all 0.2s ease-in-out;
  padding: 1rem;
  &:hover {
    transform: scale(1.05);
  }
  img {
    transition: all 0.2s ease-in-out;
    &:hover {
      transform: scale(1.02);
    }
  }
  h3 {
    font-size: 2rem;
    padding: 1rem 0 0 0.5rem;
  }
  p {
    font-size: 1.3rem;
    padding: 1rem 0 0.5rem 0.5rem;
  }
  .buttons {
    padding-top: 1rem;
    .edit {
      border-radius: 20px;
      background: #ffb60a;
      padding: 1rem 3.5rem;
      font-size: 1.5rem;
      color: white;
      border: 0;
      margin-right: 1.5rem;
      transition: all 0.2s ease-in-out;
      &:hover {
        cursor: pointer;
        transform: scale(1.1);
      }
    }
    .remove {
      border-radius: 20px;
      background: #e8eaec;
      padding: 1rem 3.5rem;
      font-size: 1.5rem;
      color: ${(props) => props.theme.black};
      border: 0;
      transition: all 0.2s ease-in-out;
      &:hover {
        cursor: pointer;
        transform: scale(1.1);
      }
    }
  }
`
