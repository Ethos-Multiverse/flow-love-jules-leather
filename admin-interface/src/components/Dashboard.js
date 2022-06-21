import * as React from "react";
import { Card, CardContent, CardHeader, Container } from "@mui/material";
// import { Masonry } from "@mui/lab";
import Masonry from "react-masonry-css";
import { styled } from "@mui/material/styles";
import Paper from "@mui/material/Paper";

const heights = [150, 500];

const Item = styled(Paper)(({ theme }) => ({
  backgroundColor: theme.palette.mode === "dark" ? "#1A2027" : "#fff",
  ...theme.typography.body2,
  padding: theme.spacing(0.5),
  textAlign: "center",
  color: theme.palette.text.secondary,
}));

export default () => (
  <React.Fragment>
    {/* <Container maxWidth="lg">
      <Card>
          <CardHeader title="LJL Admin" />
          <CardContent>Lorem ipsum sic dolor amet sic...</CardContent>
      </Card>
    </Container> */}
    <Container>
      <Masonry
        breakpointCols={3}
        className="my-masonry-grid"
        columnClassName="my-masonry-grid_column"
      >
        {heights.map((height, index) => (
          <div>
          <Item key={index} sx={{ height }}>
            {index + 1}
          </Item>
          </div>
        ))}
      </Masonry>
    </Container>
  </React.Fragment>
);
