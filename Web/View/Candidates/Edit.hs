module Web.View.Candidates.Edit where
import Web.View.Prelude

data EditView = EditView { candidate :: Candidate, statuses :: [Status]}

instance CanSelect Status where
    -- Here we specify that the <option> value should contain a `Id User`
    type SelectValue Status = Text  
    -- Here we specify how to transform the model into <option>-value
    selectValue = get #name
    -- And here we specify the <option>-text
    selectLabel = get #name

instance View EditView where
    html EditView { .. } = [hsx|
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href={CandidatesAction}>Candidates</a></li>
                <li class="breadcrumb-item active">Edit Candidate</li>
            </ol>
        </nav>
        <h1>Edit Candidate</h1>
        {renderForm candidate statuses}
    |]

renderForm :: Candidate -> [Status] -> Html
renderForm candidate statuses = formFor candidate [hsx|
    {(textField #name)}
    {(textField #email)}
    {(textField #skills)}
    {(textField #profile)}
    {(textField #education)}
    {(textField #city)}
    {(textField #country)}
    {(textField #linkedin)}
    {(textField #github)}
    {(textField #englishLevel)}
    {(selectField #status statuses)}
    {(textareaField #comments)}
    {submitButton}
|]
