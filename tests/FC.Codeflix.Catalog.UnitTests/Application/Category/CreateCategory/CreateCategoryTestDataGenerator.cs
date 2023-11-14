namespace FC.Codeflix.Catalog.UnitTests.Application.Category.CreateCategory
{
    public class CreateCategoryTestDataGenerator
    {
        public static IEnumerable<object[]> GetInvalidInputs(int times = 12)
        {
            var fixture = new CreateCategoryTestFixture();
            var invalidInputsList = new List<object[]>();
            var totalInvalidCases = 3;

            for (int i = 0; i < times; i++)
            {
                switch (i % totalInvalidCases)
                {
                    case 0:
                        invalidInputsList.Add(new object[]
                        {
                            fixture.GetInvalidInputShortName(),
                            "Name should be at leats 3 caracters long"
                        });
                        break;
                    case 1:
                        invalidInputsList.Add(new object[]
                        {
                            fixture.GetInvalidInputLongName(),
                            "Name should be less or equal 255 caracteres"
                        });
                        break;
                    case 2:
                        invalidInputsList.Add(new object[]
                        {
                            fixture.GetInvalidInputLongDescription(),
                            "Description should be less or equal 10000 caracteres"
                        });
                        break;
                    default:
                        break;
                }
            }
            return invalidInputsList;
        }
    }
}
