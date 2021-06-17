module Web.View.Candidates.FilterCandidates where
import Web.View.Prelude


data FilterCandidatesView = FilterCandidatesView { candidates :: [Candidate] }

instance View FilterCandidatesView where
    html FilterCandidatesView { .. } = [hsx|
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <a class="navbar-brand" href="/">Talent</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item active">
                        <a class="nav-link" href="/Candidates">Candidates</a>
                    </li>
                    <li class="nav-item active">
                        <a class="nav-link" href="/FilterCandidates?candidatesState=new">New</a>
                    </li>
                    <li class="nav-item active">
                        <a class="nav-link" href="/FilterCandidates?candidatesState=interviewed">Interviewed</a>
                    </li>
                    <li class="nav-item active">
                        <a class="nav-link" href="/FilterCandidates?candidatesState=contacted">Contacted</a>
                    </li>
                    <li class="nav-item active">
                        <a class="nav-link" href="/FilterCandidates?candidatesState=tech interview">Tech interview</a>
                    </li>
                </ul>
            </div>
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
