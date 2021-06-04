module Web.View.Candidates.Index where
import Web.View.Prelude

data IndexView = IndexView { candidates :: [Candidate] }

instance View IndexView where
    html IndexView { .. } = [hsx|
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item active"><a href={CandidatesAction}>Candidates</a></li>
            </ol>
        </nav>
        <h1>Index <a href={pathTo NewCandidateAction} class="btn btn-primary ml-4">+ New</a></h1>
        <div class="table-responsive">
            {forEach candidates renderCandidate}
        </div>
    |]


renderCandidate :: Candidate -> Html
renderCandidate candidate = [hsx|
    <ul class="list-group mb-3">
        <li class="list-group-item d-flex justify-content-between lh-condensed">
            <div>
            <h6 class="my-0">{(get #name candidate)}</h6>
            <small class="text-muted">{(get #education candidate)}</small><br>
            <small class="text-muted">{(get #email candidate)}</small><br>
            <small class="text-muted">{(get #status candidate)}</small><br>
            <small class="text-muted">{(get #education candidate)}</small><br>

            <small class="text-muted"><a href={ShowCandidateAction (get #id candidate)}>Show</a>&nbsp;</small>
            <small class="text-muted"><a href={EditCandidateAction (get #id candidate)} class="text-muted">Edit</a>&nbsp;</small>
            <small class="text-muted"><a href={DeleteCandidateAction (get #id candidate)} class="js-delete">Delete</a>&nbsp;</small>
            </div>
        </li>
    </ul>
|]


