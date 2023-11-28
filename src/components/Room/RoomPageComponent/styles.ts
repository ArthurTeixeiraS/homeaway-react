import styled from 'styled-components'

export const Container = styled.div`
  padding: 4rem 1rem;
  .loading {
    padding: 10rem 5rem;
    text-align: center;
  }
  .mainContent {
    display: flex;
  }
  .content {
    display: flex;
    flex-direction: column;
    margin-left: -1rem;
    margin-top: 2rem;
    .title {
      display: flex;
      flex-direction: column;
      justify-content: left;
      align-items: left;
      margin-left: 5rem;
      margin-bottom: 2rem;
      h1 {
        font-size: 3rem;
      }
      h3 {
        font-weight: normal;
        span {
          font-weight: bold;
        }
      }
    }
    .location {
      display: flex;
      flex-direction: column;
      justify-content: left;
      align-items: left;
      margin-left: 5rem;
      margin-bottom: 3rem;
    }
    .price {
      display: flex;
      flex-direction: column;
      justify-content: left;
      align-items: left;
      margin-left: 5rem;
      h1 {
        font-size: 3rem;
        span {
          font-weight: normal;
          font-size: 1.5rem;
        }
      }
      h3 {
        font-weight: normal;
        span {
          font-weight: bold;
        }
      }
    }
    .feedback {
      display: flex;
      flex-direction: column;
      justify-content: left;
      align-items: left;
      margin-left: 5rem;
      margin-top: 1rem;
      h3 {
        display: flex;
        align-items: center;
      }
    }
    .reserveNow {
      display: flex;
      flex-direction: column;
      justify-content: left;
      align-items: left;
      margin-left: 5rem;
      margin-top: 5rem;
      button {
        padding: 1rem 0rem;
        color: white;
        background-color: ${(props) => props.theme['blue-primary']};
        border: 0;
        border-radius: 2rem;
        font-size: 1.5rem;
        transition: all 0.2s ease-in-out;
        &:hover {
          transform: scale(1.05);
        }
      }
      p {
        margin-top: 0.5rem;
      }
    }
  }
  .image {
    border-radius: 2rem;
    padding-right: 0;
    margin-top: 1rem;
    margin-left: 5rem;
    img {
      width: 50rem;
      height: 50rem;
      border-radius: 2rem;
    }
  }
  .infoBlocs {
    margin-top: 7rem;
    display: flex;
    justify-content: start;
    margin-left: 5rem;
    align-items: center;
    .roomblock,
    .allowPets,
    .hasWifi {
      width: 15rem;
      height: 15rem;
      display: flex;
      justify-content: center;
      flex-direction: column;
      align-items: center;
      background-color: ${(props) => props.theme['background-gray']};
      border-radius: 1.5rem;
      h2 {
        margin-top: 1rem;
        text-align: center;
      }
    }
    .allowPets {
      margin: 0 2rem 0 2rem;
    }
    .hostInfos {
      padding-left: 5rem;
      .hostInfoContent {
        display: flex;
        flex-direction: row;
        img {
          width: 7rem;
        }
        .infos {
          margin-left: 1rem;
          margin-top: 1rem;
        }
        p {
          font-size: 1.2rem;
        }
      }
      .title {
        margin-bottom: 1rem;
      }
    }
  }
  .descAndHotel {
    display: flex;
    img {
      width: 22rem;
      height: 20rem;
      border-radius: 2rem;
    }
    .hotelInfo {
      margin-right: 8rem;
      margin-top: 5rem;
      display: flex;
      justify-content: start;
      .infos {
        margin-top: 2rem;
        margin-left: 1rem;
        h3 {
          margin-top: 1rem;
          margin-bottom: 1rem;
        }
      }
    }
  }
  .description {
    width: 40%;
    margin-top: 5rem;
    display: flex;
    justify-content: flex-start;
    flex-direction: column;

    margin-left: 5rem;
    h1 {
      font-size: 3rem;
    }
    p {
      margin-top: 1rem;
      font-size: 1.5rem;
      width: 90%;
    }
  }
`
